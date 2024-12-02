import router from '@ohos.router'

@Entry
@Component
struct Index {
  build() {
    Row() {
      Column({space: 20}) {
        Text('网络框架封装，新版开发工具demo:')
          .fontSize(20)
        Button('点击我体验Axios封装网络框架')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/AxiosButtonPage'
            })
          })
        Button('点击我体验HTTP封装网络框架')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/HTTPButtonPage'
            })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}