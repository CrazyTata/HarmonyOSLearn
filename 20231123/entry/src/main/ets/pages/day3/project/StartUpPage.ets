import { router } from '@kit.ArkUI';

@Entry
@Component
struct StartUpPage {
  @State translateY_logo: number = -200;

  @State translateY_text: number = 200

  build() {
   Column({space:10}){
      Image($r('app.media.github_logo_icon'))
        .width(200)
        .height(200)
        .objectFit(ImageFit.Contain) //缩放模式
        .translate({
          y:this.translateY_logo
        }) //平移距离
        .animation({
          duration:2000,
          tempo:1,
          curve:Curve.FastOutSlowIn, //播放属性
          delay:500, //延迟0.5s
          iterations:1, //-1 无限循环
          //播放支持
          playMode:PlayMode.Normal
        }) //只对它前面的样式负责，所以一般放最底下

     Text('health')
       .fontSize(20)
       .fontWeight(700)
       .letterSpacing(10)
       .translate({y:this.translateY_text})
       .textCase(TextCase.UpperCase)
       .animation({
         duration:2000,
         delay:500,
         iterations:1,
         tempo:1,
         curve:Curve.FastOutSlowIn
       })
       .onAppear(()=>{
         this.translateY_logo = 0
         this.translateY_text = 0

         let id = setInterval(()=>{
           router.replaceUrl({
             url:'pages/day3/project/login/LoginPage'
           })

           clearInterval(id)
         },3000)
       })
   }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImage($r('app.media.splash_background'))
  }
}