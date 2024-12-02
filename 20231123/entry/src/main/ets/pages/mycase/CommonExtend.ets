
@Extend(Text) function myText(color:Color,oc:()=>void){
  .backgroundColor(color)
  .onClick(oc)
  .width(200)
  .aspectRatio(1)
  .borderRadius(12)
  .textAlign(TextAlign.Center)
}

@Entry
@Component
struct CommonExtend {
  @State message: string = 'Hello World';

  @State num:number=0

  build() {
   Column({space:6}){
     Text(String(this.num))

     Text('+1')
       .myText(Color.Pink,()=>{
         this.num++
       })

     Text('-1')
       .myText(Color.Gray,()=>{
         this.num--
       })
   }
    .height('100%')
    .width('100%')
  }
}