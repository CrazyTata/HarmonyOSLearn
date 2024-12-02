import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct UserLoginCase {
  @State account: string = '';
  @State password: string = '';


  build() {
   Column({space:10}){

     //账户UI设计
     Row(){
       Text('账户：')
         .fontWeight(600)
         .fontSize(20)
       TextInput({text:$$this.account})
         .layoutWeight(1)
     }
     //密码UI设计
     Row(){
       Text('密码：')
         .fontWeight(600)
         .fontSize(20)
       TextInput({text:$$this.password})
         .type(InputType.Password)
         .layoutWeight(1)
     }
     //提交和重置按钮
     Row({space:10}){
      Button('提交')
        .backgroundColor(Color.Gray)
        .onClick(()=>{
          if (this.account=='tata'&&this.password=='888888'){
            promptAction.showToast({message:'登陆成功'})
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