/**
 * @ProjectName : HealthyDiet
 * @FileName : HttpManager
 * @UserName : 修梦
 * @Time : 2024/7/29 01:22
 * @Description : Http对外管理类
 */
import { httpCore as HttpCore } from './HttpCore'
import { RequestOptions } from './RequestOptions'

export class HttpManager {
  private static mInstance: HttpManager
  //防止实例化
  private constructor() {
  }
  static getInstance(): HttpManager {
    if (!HttpManager.mInstance) {
      HttpManager.mInstance = new HttpManager()
    }
    return HttpManager.mInstance
  }
  request<T>(option: RequestOptions): Promise<T> {
    return HttpCore.request(option)
  }

}