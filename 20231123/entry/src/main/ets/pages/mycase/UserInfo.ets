import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct UserInfo {
  @State account: string = '';
  @State password: string = '';

  build() {
    Column({space:10}){
      Row(){
          Text('账号：')
            .fontWeight(600)
            .fontSize(30)
        TextInput({text:$$this.account,placeholder:'手机号/用户名/邮箱'})
          .layoutWeight(1)
          .placeholderColor(Color.Gray)
      }

      Row(){
        Text('密码：')
          .fontWeight(600)
          .fontSize(30)

        TextInput({text:$$this.password,placeholder:'输入8位密码'})
          .type(InputType.Password)
          .layoutWeight(1)
      }

      Row(){
        Button('提交')
          .margin(10)
          .onClick(()=>{
            if (this.account=='tata'&&this.password=='888888'){
              promptAction.showToast({message:'success'})
            }else{
              promptAction.showToast({message:'error'})
            }
          })
        Button('重置')
          .onClick(()=>{
            this.account=''
            this.password=''
          })
      }
    }
    .padding(10)
    .height('100%')
    .width('100%')
  }
}