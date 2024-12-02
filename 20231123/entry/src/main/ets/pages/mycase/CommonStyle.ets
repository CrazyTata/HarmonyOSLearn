//全局通用样式
@Styles
function CommonStyle11(){
  .backgroundColor(Color.Brown)
  .width(200)
  .height(100)
}

@Entry
@Component
struct CommonStyle {
  @State message: string = 'Hello World';

  @State num:number = 0
  //局部通用
  @Styles CommonStyle11(){
  .backgroundColor(Color.Brown)
  .width(200)
  .height(100)
}

  build() {
   Column({space:8}){
     Text(String(this.num))
     Button('+1')
       .onClick(()=>{
         this.num++
       })
       .type(ButtonType.Normal)
       .CommonStyle11()
     Button('-1')
       .onClick(()=>{
         this.num--
       })
       .type(ButtonType.Capsule)
       .CommonStyle11()
   }
    .height('100%')
    .width('100%')
  }
}