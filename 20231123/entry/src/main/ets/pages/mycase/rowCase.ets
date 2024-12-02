@Entry
@Component
struct RowCase {
  @State message: string = 'Hello World';

  build() {
    Column({ space: 10 }) {
        Column()
          .width(200)
          .height(50)
          .backgroundColor(Color.Pink)
        Column()
          .width(100)
          .height(50)
          .backgroundColor(Color.Red)
        Column()
          .width(50)
          .height(50)
          .backgroundColor(Color.Blue)
      }
    .width('100%')
    .height('100%')
  }
}