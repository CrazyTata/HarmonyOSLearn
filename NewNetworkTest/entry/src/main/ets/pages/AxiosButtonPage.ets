/**
 * @ProjectName : NetworkTest
 * @FileName : AxiosButtonPage
 * @UserName : 修梦
 * @Time : 2024/8/26 00:18
 * @Description : 文件描述
 */
import { loverWordsApi, PlatformApi } from './axiosFile/AxiosAPI';
import { PlatformBase, platformData } from './base/PlatformBase';
import { LoverWordsBase } from './base/LoverWordsBase';
import router from '@ohos.router';
import { it } from '@ohos/hypium';

@Entry
@Component
struct AxiosButtonPage {

  @State loverWords: string = 'Hello World';
  @State Platform: string = ''
  num: number = 0

  //声明周期获取渣男语录，切记async异步请求
  async  aboutToAppear (){
    let response:LoverWordsBase = await loverWordsApi()
    this.loverWords = response.returnObj[0].toString()
  }
  build() {
    Row() {
      Column({space: 20}) {
        Text('这里是新版本Axios网络框架封装，旧版本请移步')
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
            this.num ++
            let response:PlatformBase = await PlatformApi()
            this.Platform = response.data[this.num].title
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