import { LengthUnit } from '@kit.ArkUI';

@Entry
@Component
struct ImageViewCase {
  //预览图片的范围是100-400
  @State imgHeight: number = 200;

  min: number = 100
  max: number = 400
  step: number = 20



  build() {
    Flex(
      {
        direction:FlexDirection.Column,
        alignItems:ItemAlign.Center,
        space:{main:{value:10,unit:LengthUnit.VP}}
      }
    ){
      //标题
      Text($r('app.string.imgView'))
        .fontColor(Color.Green)
        .fontSize(30)
        .fontWeight(1)
        .margin({top:20})
      //图片
      //通过网络方式加载
      // Image('')
      //   .height(200)

      //加载路径 resource/base/media
      //Image($r('app.media.mate60')).height(200)

      Row(){
      Image($rawfile('mate60.png')).height(this.imgHeight)
        .width('100%')
        .layoutWeight(1)
        .backgroundColor(Color.Gray)

    }
      //输入框调整图片高度
      Row(){
        Text($r('app.string.imagHeight'))
          .fontColor('#36d')
          .fontSize(30)
          .fontWeight(600)
        TextInput({placeholder:`请输入${this.min}-${this.min}之间的数值`})
          .type(InputType.Number)
          .layoutWeight(1)
          .onChange((value)=>{
            let num:number=Number(value)

            if (num>=100&&num<=400){
              this.imgHeight = num
            }
          })

      }.padding(5).width('100%')
      //通过按钮调整图片高度
      Row(){
        Button($r('app.string.zoomBig'))
          .onClick(()=>{
            if (this.imgHeight+this.step >400){
              this.imgHeight=400
            }else{
              this.imgHeight+=20
            }
          })
        Button($r('app.string.zoomMin')).onClick(()=>{
          if (this.imgHeight-this.step <100){
            this.imgHeight=100
          }else{
            this.imgHeight-=20
          }
        })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      //通过滑动条调整图片高度
      Slider({
        value:this.imgHeight,
        min :this.min,
        max :this.max,
        step:this.step
      }).onChange((value)=>{
        this.imgHeight = value
      })

    }.width('100%')
    .height('100%')
  }
}

//图片预览：imgView
//图片高度：imagHeight
//请输入：  inputPrefix
//的数字:   inputSuffix
//放大:   zoomBig
//缩小    zoomMin