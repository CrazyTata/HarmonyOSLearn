@Entry
@Component
struct LayoutBaseGridCase {
  @State message: string = 'Hello World';

  build() {
   Grid(){
     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')
     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

     GridItem().backgroundColor(Color.Orange)
       .width('100')
       .height('100')

   }
   .padding(10)
   .columnsTemplate('1fr 1fr')
   .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
   .rowsGap(10)
   .columnsGap(10)
   .backgroundColor(Color.Gray)
    .width('100%')
    .height('100%')
  }
}