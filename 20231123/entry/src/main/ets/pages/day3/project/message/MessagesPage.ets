@Entry
@Component
export struct MessagesPage {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Text('信息页面')
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Blue)
  }
}