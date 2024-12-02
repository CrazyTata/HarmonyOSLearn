import { promptAction, router } from '@kit.ArkUI'
import { UserBase } from '../base/UserBase'
import PreferencesUtils from '../util/PreferencesUtils'

@Entry
@Component
struct RegisterPage {

  @Provide isName:string = ''
  @Provide isPassword:string=''
  @Provide isAgainPassword:string=''

  @Provide isNameShowRed:boolean = true
  @Provide isPasswordShowRed:boolean = true
  @Provide isAgainPasswordShowRed:boolean = true

  build() {
    Column({space:10}){
      RegisterTitleText()

      RegisterHeader()

      RegisterInput()
      //自适应拉伸
      Blank()

      Button(){
        Text('注册')
          .fontColor(Color.White)
          .fontSize(30)
          .fontWeight(700)
          .padding(10)
          .width('90%')
          .textAlign(TextAlign.Center)
      }.width('90%')
      .backgroundColor('#ff834a4a')
      .margin({bottom:50})
      .onClick(()=>{
        if (this.isName==='' || this.isName ===null||this.isName.trim().length===0){
          promptAction.showToast({message:'用户名错误'})
          this.isNameShowRed = false
          return
        }else{
          this.isNameShowRed = true
        }
        if (this.isPassword==='' || this.isPassword ===null||this.isPassword.trim().length===0){
          promptAction.showToast({message:'密码错误'})
          this.isPasswordShowRed = false
          return
        }else{
          this.isPasswordShowRed = true
        }
        if (this.isAgainPassword==='' || this.isAgainPassword ===null||this.isAgainPassword.trim().length===0){
          promptAction.showToast({message:'密码错误'})
          this.isAgainPasswordShowRed = false
          return
        }else{
          this.isAgainPasswordShowRed = true
        }

        if (this.isAgainPassword!==this.isPassword){
          promptAction.showToast({message:'两个密码不一致'})
          this.isPasswordShowRed = false
          this.isAgainPasswordShowRed = false
          return
        }else{
          this.isPasswordShowRed = true
          this.isAgainPasswordShowRed = true
        }

        promptAction.showToast({message:'注册成功'})
        let userBase:UserBase={
          name:this.isName,
          pwd:this.isPassword
        }

        PreferencesUtils.putPreferences('myPref','userInfo',JSON.stringify(userBase))

        router.back()

      })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.splash_background'))
    .backgroundImageSize({width:'100%',height:'100%'})
  }
}


@Component
struct RegisterHeader {
  build() {
    Column(){
      Image($r('app.media.github_logo_icon'))
        .width(150)
        .height(150)
        .objectFit(ImageFit.Contain)
        .margin({top:100})

      Text('欢迎注册')
        .fontSize(20)
        .fontWeight(700)


    }
  }
}

@Component
struct RegisterInput {
  @Consume isName:string
  @Consume isPassword:string
  @Consume isAgainPassword:string


  @Consume isNameShowRed:boolean
  @Consume isPasswordShowRed:boolean
  @Consume isAgainPasswordShowRed:boolean


  build() {
    Column({space:20}){
      //多行输入框多了最大行数的属性
      TextInput({ placeholder: '请输入用户名' })
        .RegisterInputStyle(InputType.Normal,this.isNameShowRed)
        .onChange((value:string)=>{
          this.isName = value
        })

      TextInput({ placeholder: '请输入密码' })
        .RegisterInputStyle(InputType.Password,this.isPasswordShowRed)
        .onChange((value:string)=>{
          this.isPassword = value
        })



      TextInput({ placeholder: '请再次输入密码' })
        .RegisterInputStyle(InputType.Password,this.isAgainPasswordShowRed)
        .onChange((value:string)=>{
          this.isAgainPassword = value
        })


    }
  }
}

@Extend(TextInput)
function RegisterInputStyle(myInputType?: InputType,borderColor?:boolean) {
  .borderRadius(10)
  .width('90%')
  .height(50)
  .border({ width: 1, color: borderColor?Color.Gray: Color.Red })
  .type(myInputType)

}

@Component
struct RegisterTitleText {
  build() {
    Stack({alignContent:Alignment.Start}){
      Text('注册页面')
        .width('100%')
        .textAlign(TextAlign.Center)

      Image($r('app.media.back'))
        .width(30)
        .height(20)
        .objectFit(ImageFit.Fill)
        .onClick(()=>{
          router.back()
        })

    }
    .padding(10)
  }
}