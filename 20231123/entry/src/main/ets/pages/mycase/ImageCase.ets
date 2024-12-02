@Entry
@Component
struct ImageCase {

  @State min:number = 100
  @State max:number = 400
  @State heightImg:number = 300

  step:number = 20

  build() {
    Column({space:10}){
      Text('tata')
        .backgroundColor(Color.Pink)
        .fontSize(30)
        .fontWeight(600)

      Image($rawfile('mate60.png')).width('100%').height(this.heightImg)

      Row(){
        Text('图片高度:')
          .fontSize(20)
          .fontWeight(600)
        TextInput({placeholder:`请输入${this.min}-${this.min}之间的数值`})
          .type(InputType.Number)
          .layoutWeight(1)
          .onChange((value)=>{
            let num:number = Number(value)
            if (num<this.max&&num>this.min){
              this.heightImg=num
            }}
            )
      }
      Row({space:15}){
        Button('放大')
          .onClick(()=>{
            if (this.heightImg+this.step>this.max){
              this.heightImg=this.max
            }else{
              this.heightImg+=this.step
            }
          })
        Button('缩小')
          .onClick(()=>{
            if (this.heightImg-this.step<this.min){
              this.heightImg=this.min
            }else{
              this.heightImg-=this.step
            }
          })
      }
      Row(){
        Slider({min:this.min,max:this.max})
          .blockColor(Color.Blue)
          .showTips(true)
          .onChange((value: number, mode: SliderChangeMode)=>{
              let num:number = Number(value)
              if (num<this.max&&num>this.min){
                this.heightImg=num
              }
          })
      }.margin(20)


    }
    .padding(10)
    .height('100%')
    .width('100%')
  }
}