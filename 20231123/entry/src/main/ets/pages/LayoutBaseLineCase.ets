@Entry
@Component
struct LayoutBaseLineCase {
  @State message: string = 'Hello World';

  build() {
    // 有且只能有一个组件，一般使用布局组件作为我们的根节点
    //线性横行布局
    Column(){
      Text('文本1')
        .width('25%')
        .aspectRatio(1)
        .backgroundColor(Color.Gray)

      Text('文本2')
        .width('25%')
        .aspectRatio(1)
        .backgroundColor(Color.Orange)

      Text('文本3')
        .width('25%')
        .aspectRatio(1)
        .backgroundColor(Color.White)


    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.Pink)
    .width('50%')
    .aspectRatio(1)
  }
}