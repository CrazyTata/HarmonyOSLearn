import { router } from '@kit.ArkUI';

@Entry
@Component
struct Second {
  @State message: string = 'Hello World';
  private option: router.RouterOptions = {
    url: "pages/Third"
  }
  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld2')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          top: { anchor: '__container__', align: VerticalAlign.Top }
        })
      Button('My Button2').onClick((event: ClickEvent) => {
        router.pushUrl(this.option)
      })
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center}
        })
        // .padding(this.offset + 10)
        // .height(30)
    }
    .height('100%')
    .width('100%')

  }
}