@Component
struct ScrollItem{
  build() {
    Row() {
      Text("滚动区域内容")
    }
    .width('100%')
    .height(80)
    .backgroundColor(Color.Orange)
    .borderRadius(8)
    .margin({
      top: 20,
      bottom: 10
    })
    .justifyContent(FlexAlign.Center)
  }

}

@Entry
@Component
struct ScrollCase {
  @State message: string = 'Hello World';

  build() {
   Column(){
     Row(){
        Text('顶部')
     }.width('100%')
     .height('10%')
     .backgroundColor(Color.Red)
     .justifyContent(FlexAlign.Center)


     Scroll(){
       Column({space:10}){
         ScrollItem()
         ScrollItem()
         ScrollItem()
         ScrollItem()
         ScrollItem()
         ScrollItem()
         ScrollItem()
         ScrollItem()
       }
     }
     .width('100%')
     .height(550)
     .backgroundColor(Color.Pink)


     Row(){
        Text('底部')
     }.width('100%')
     .height('10%')
     .backgroundColor(Color.Blue)
     .justifyContent(FlexAlign.Center)


   }
    .height('100%')
    .width('100%')
    .padding(10)
  }
}