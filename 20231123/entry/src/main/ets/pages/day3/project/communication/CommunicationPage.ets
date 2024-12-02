@Entry
@Component
export struct CommunicationPage {
  @State message: string = 'Hello World';

  build() {
   Column(){
     Text('我是联系人页面')
   }
    .height('100%')
    .width('100%')
   .backgroundColor(Color.Yellow)
  }
}
