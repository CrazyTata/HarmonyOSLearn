@Entry
@Component
struct ScrollRowCase {
  @State message: string = 'Hello World';
  scroller: Scroller = new Scroller()
  build() {
    Row() {
      Column() {
        // 有且只有一个组件
        Scroll(this.scroller) {
          Row({ space: 20 }) {
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
            Actor()
          }
        }
        .height(200)
        .scrollable(ScrollDirection.Horizontal)
        .width('100%')
        .backgroundColor(Color.Orange)
        Row() {
          Button("滚到左侧")
            .onClick(() => {
              this.scroller.scrollEdge(Edge.Start)
            })
          Button("滚到右侧")
            .onClick(() => {
              this.scroller.scrollEdge(Edge.End)
            })
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}
@Component
struct Actor {
  build() {
    Row() {
      Text("热辣滚烫-贾玲")
        .fontColor(Color.White)
    }
  }
}