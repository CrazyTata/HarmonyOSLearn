@Entry
@Component
struct BuilderCase {

  @Builder myFunction(title1:string,title2:string){
    Column(){
      Row(){
        Text(title1)
          .fontWeight(600)
        Text(title2)
          .fontColor(Color.Gray)
      }
      .padding(10)
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
    }
  }

  build() {
   GridRow({columns:2,gutter:5}){
      GridCol({span:2}){
       this.myFunction('评价（2000+）','查看更多>')
      }.backgroundColor(Color.White)
       .height(150)
      .borderRadius(10)

     GridCol({span:1}){
       this.myFunction('推荐','查看更多>')
     }.backgroundColor(Color.White)
     .backgroundColor(Color.White)
     .height(150)
     .borderRadius(10)

     GridCol({span:1}){
       this.myFunction('体验','查看更多>')
     }.backgroundColor(Color.White)
     .backgroundColor(Color.White)
     .height(150)
     .borderRadius(10)
   }
   .padding(10)
   .backgroundColor(Color.Pink)
    .height('100%')
    .width('100%')
  }
}