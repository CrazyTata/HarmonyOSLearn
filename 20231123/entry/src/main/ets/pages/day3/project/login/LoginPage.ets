import { promptAction, router } from '@kit.ArkUI';
import PreferencesUtils from '../util/PreferencesUtils';
import { UserBase } from '../base/UserBase';

@Entry
@Component
struct LoginPage {
  @Provide isName:string = ''
  @Provide isPassword:string=''

  @State userInfo:UserBase = new UserBase()

  onPageShow(): void {
    PreferencesUtils.getPreferences('myPref','userInfo').then((value)=>{
      console.log("user-info:",value)
      this.userInfo = JSON.parse(value as string)
      console.log("user-info1111:",this.userInfo.name,this.userInfo.pwd)
    })
  }

  build() {
    Column({space:10}){
      LoginHeader()

      LoginInput()
      //自适应拉伸
      Blank()

      Button(){
        Text('登录')
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
        console.log("user input",this.isPassword,this.isName);
        if (this.isName==this.userInfo.name && this.isPassword==this.userInfo.pwd ){
          promptAction.showToast({message:'登录成功'})
          router.replaceUrl({
            url:'pages/day3/project/MainPage',
            params:{
              name:this.isName
            }
          })
        }else{
          promptAction.showToast({message:'用户信息错误'})
        }
      })
    }
    .height('100%')
    .width('100%')
    .backgroundImage($r('app.media.splash_background'))
    .backgroundImageSize({width:'100%',height:'100%'})
  }
}


@Component
struct LoginHeader {
  build() {
    Column(){
      Image($r('app.media.github_logo_icon'))
        .width(150)
        .height(150)
        .objectFit(ImageFit.Contain)
        .margin({top:100})

      Text('欢迎登入')
        .fontSize(20)
        .fontWeight(700)


    }
  }
}

@Component
struct LoginInput {
  @Consume isName:string
  @Consume isPassword:string

  build() {
    Column({space:20}){
      TextInput({ placeholder: '请输入用户名' })
        .InputStyle()
      //多行输入框多了最大行数的属性
        .onChange((value:string)=>{
          this.isName = value
        })

      TextInput({ placeholder: '请输入密码' })
        .InputStyle(InputType.Password)
      //多行输入框多了最大行数的属性
        .onChange((value:string)=>{
          this.isPassword = value
        })

      Text('注册')
        .width('85%')
        .textAlign(TextAlign.End)
        .fontColor(Color.Blue)
        .offset({top:-10})
        .onClick(()=>{
          router.pushUrl({
            url:'pages/day3/project/login/RegisterPage'
          })
        })
    }
  }
}

@Extend(TextInput)
function InputStyle(myInputType?:InputType) {
  .borderRadius(10)
  .width('90%')
  .height(50)
  .border({ width: 1, color: '#ff0c0a0a' })
  .type(myInputType)

}
