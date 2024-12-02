@Entry
@Component
struct Scroll1Case {
  @State message: string = 'Hello World';
  @State middleHeight: number = 0
  scroller: Scroller = new Scroller() // 在组件中声明一个scroller的实例
  build() {
    Column() {
      Row()
        .width('100%')
        .height(50)
        .backgroundColor(Color.Red)
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Bottom)
        })
      // Scroll List Grid Swiper WaterFlow
      Scroll(this.scroller) {
        // 有且只能有一个组件
        Column() {
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
          ScrollItem1()
        }
      }
      .scrollBarColor(Color.Red)
      .width('100%')
      .height(this.middleHeight)
      .backgroundColor(Color.Orange)
      Row()
        .width('100%')
        .height(50)
        .backgroundColor(Color.Blue)
        .onClick(() => {
          this.scroller.scrollEdge(Edge.Top)
        })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height('100%')
    .onAreaChange((old: Area, newArea: Area) => {
      this.middleHeight = (newArea.height as number) - 100
    })
  }
}
@Component
struct ScrollItem1 {
  build() {
    Row() {
      Text("滚动区域内容")
    }
    .width('100%')
    .height(80)
    .backgroundColor(Color.Pink)
    .borderRadius(8)
    .margin({
      top: 20,
      bottom: 10
    })
    .justifyContent(FlexAlign.Center)
  }
}