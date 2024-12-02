/**
 * @ProjectName : NetworkTest
 * @FileName : HTTPButtonPage
 * @UserName : 修梦
 * @Time : 2024/8/26 00:22
 * @Description : 文件描述
 */
import router from '@ohos.router';
import { LoverWordsBase } from './base/LoverWordsBase';
import { PlatformBase } from './base/PlatformBase';
import { HttpManager } from './httpFile/HttpManager';
import { RequestMethod } from './httpFile/RequestOptions';

@Entry
@Component
struct HTTPButtonPage {

  @State loverWords: string = 'Hello World';
  @State Platform: string = ''
  num: number = 0

  //声明周期获取渣男语录，切记async异步请求
  async aboutToAppear (){

    HttpManager.getInstance()
      .request<LoverWordsBase>({
        method: RequestMethod.GET,
        url: 'https://api.lovelive.tools/api/SweetNothings/1/Serialization/Json'
      })
      .then((result) => {
        this.loverWords = result.returnObj[0]
      })
      .catch((err:object) => {
        console.error('err: '+JSON.stringify(err))
      })
  }

  build() {
    Row() {
      Column({space: 20}) {
        Text('这里是新版本HTTP网络框架封装，旧版本请移步')
          .fontSize(20)
          .margin({bottom: 20})
        Text('渣男语录:')
          .fontSize(20)
        Text(this.loverWords)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Divider().margin({top: 20, bottom: 20})
        //点击请求平台新闻接口
        Text('平台新闻:(点击获取新闻)')
          .onClick(async () => {
            HttpManager.getInstance()
              .request<PlatformBase>({
                method: RequestMethod.GET,
                url:'https://uapis.cn/api/hotlist?type=bilibili'
              })
              .then((result) => {
                this.Platform = result.data[this.num].title
              })
              .catch((err:object) => {
                console.error('err: '+JSON.stringify(err))
              })
          })
        Text('新闻： '+this.Platform)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Button('返回')
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}