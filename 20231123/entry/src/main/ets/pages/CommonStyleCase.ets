
@Extend(Button) function BtnCommonStyle(
  btnStyle:ButtonType,
  color:Color|string,
  cb:()=>void
){
  .type(btnStyle)
  .backgroundColor(color)
  .onClick(cb)
}


@Entry
@Component
struct CommonStyleCase {
  @State counter: number = 0;

  @Styles commonStyle(){
  .backgroundColor(Color.Pink)
  .onClick(()=>{
    this.counter++
  })
}
  build() {
   Column({space:10}){
     Text(String(this.counter))
     Button('点击+1')
       .BtnCommonStyle(
         ButtonType.Capsule,
         Color.Blue,
         ()=>{
           this.counter++
         }
       )


     Button('点击-1').BtnCommonStyle(
       ButtonType.Capsule,
       Color.Blue,
       ()=>{
         this.counter--
       }
     )
     // Button('点击+1')
     //   .type(ButtonType.Normal)
     // Button('点击-1')
     //   .type(ButtonType.Capsule)
   }
   .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}