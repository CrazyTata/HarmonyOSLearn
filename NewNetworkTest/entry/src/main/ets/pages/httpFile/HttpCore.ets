/**
 * @ProjectName : HealthyDiet
 * @FileName : HttpCore
 * @UserName : 修梦
 * @Time : 2024/7/29 00:54
 * @Description : Http核心类
 */
import http from '@ohos.net.http';
import { RequestOptions } from './RequestOptions';
//由于两个接口前缀不统一，就暂时没有做拆分
//新闻信息接口：https://uapis.cn/api/hotlist?type=bilibili
//情话接口：https://api.lovelive.tools/api/SweetNothings/1/Serialization/Json
const BASE_URL: string = 'https://api.lovelive.tools/api';
export class HttpCore{
  //发送请求
  request<T>(requestOption: RequestOptions): Promise<T> {
    return new Promise<T>((resolve, reject) => {
      this.sendRequest(requestOption)
        .then((response) => {
          if (typeof response.result !=='string') {
            reject(new Error('无效到数据类型'))
          } else {
            let bean: T = JSON.parse(response.result)
            if (bean) {
              resolve(bean)
            } else {
              reject(new Error('无效到数据类型,JSON解析失败'))
            }
          }
        }).catch((error:object) => {
        reject(error)
      })
    })
  }
  private sendRequest(requestOption: RequestOptions) : Promise<http.HttpResponse> {
    //每个httpRequest只能有一个Http请求，不能复用
    //创建Http 
    let httpRequest = http.createHttp()
    let token = AppStorage.get<string>('Token')
    let resolveFunction:Function, rejectFunction:Function
    const resultPromise = new Promise<http.HttpResponse>((resolve, reject) => {
      resolveFunction = resolve
      rejectFunction = reject
    })
    let map = new Map<string,string>()
    if (token != null){
      map.set('Content-Type',token)
    } else {
      map.set('Content-Type','application/x-www-form-urlencoded')
    }
    requestOption.header = map
    if (!this.isValidUrl(requestOption.url)) {
      return Promise.reject(new Error('URL格式不正确'))
    }
    let promise = httpRequest.request(this.appendQueryParams(requestOption.url, requestOption.queryParams), {
      method: requestOption.method,
      header: requestOption.header,
      extraData: requestOption.extraData,//POST请求时用此字段用于传递内容
      expectDataType: http.HttpDataType.STRING //指定返回到数据到类型

    })

    promise.then((response) => {
      console.info('Result:' + response.result)
      console.info('code:'+ response.responseCode)
      console.info('header:' + JSON.stringify(response.header))

      if (http.ResponseCode.OK !== response.responseCode) {
        throw new Error('http 不等于200')
      }
      resolveFunction(response)
    }).catch((err:object) => {
      rejectFunction(err)
    }).finally(() => {
      //请求完毕，调用destroy方法主动销毁
      httpRequest.destroy()
    })
    return resultPromise

  }
  //参数拼接到URL
  private appendQueryParams(url: string, queryParams?: Record<string, string>): string {
    if (queryParams == undefined || !queryParams) {
      return url
    }
    return url + queryParams;
  }
  //判断URL格式是否正确
  private isValidUrl(url: string): boolean {
    return true
  }
}
export const httpCore = new HttpCore()