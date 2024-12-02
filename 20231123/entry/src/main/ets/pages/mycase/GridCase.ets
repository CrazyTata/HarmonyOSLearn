
@Component
struct GridItemCase{
  build() {
    GridItem(){
      Column(){
        Text('tata').backgroundColor(Color.Orange)
          .width('38%')
          .height(100)
          .textAlign(TextAlign.Center)
          .margin(10)
      }
    }
  }
}

@Entry
@Component
struct GridCase {
  build() {
   Grid(){
     GridItemCase()
     GridItemCase()
     GridItemCase()
     GridItemCase()
     GridItemCase()
     GridItemCase()
     GridItemCase()
     GridItemCase()
     GridItemCase()
     GridItemCase()
   }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Gray)
   .rowsGap(10)
   .columnsGap(10)
  }
}