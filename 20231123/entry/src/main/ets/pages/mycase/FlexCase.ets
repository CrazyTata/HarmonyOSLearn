@Entry
@Component
struct FlexCase {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Flex({
        direction: FlexDirection.Row,
        justifyContent: FlexAlign.Start,
        wrap:FlexWrap.Wrap,
      }){
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.Orange)
          .margin(5)
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.Orange)
          .margin(5)
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.Orange)
          .margin(5)
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.Orange)
          .margin(5)

        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.Orange)
          .margin(5)
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.Orange)
          .margin(5)

        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.Orange)
          .margin(5)


      }
      .margin(10)
      .padding(10)
      .height('50%')

      Flex({
        direction: FlexDirection.Column,
        justifyContent: FlexAlign.Start,
        wrap:FlexWrap.Wrap,
      }){
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.White)
          .margin(5)
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.White)
          .margin(5)
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.White)
          .margin(5)
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.White)
          .margin(5)

        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.White)
          .margin(5)
        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.White)
          .margin(5)

        Text()
          .width('25%')
          .aspectRatio(1)
          .backgroundColor(Color.White)
          .margin(5)


      }
      .height('50%')

    }.backgroundColor(Color.Pink)
    .width('100%')
    .height('100%')

  }
}