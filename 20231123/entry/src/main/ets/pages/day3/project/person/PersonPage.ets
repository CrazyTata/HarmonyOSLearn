@Entry
@Component
export struct PersonPage {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Text('我的页面')
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Blue)
  }
}