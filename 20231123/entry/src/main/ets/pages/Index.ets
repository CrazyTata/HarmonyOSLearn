import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = '你好！';
  @State message1: string = 'tata';

  build() {
    Column() {
      Button(){
        Text('click me')
          .fontSize(20)
          .fontWeight(600)
      }.buttonStyle(ButtonStyleMode.NORMAL)
      .onClick(()=>{
        promptAction.showToast({message:'i am a click event'})
      })
      .padding(50)
      .backgroundColor(Color.Red)
    }
    .backgroundColor(Color.Gray)
    .height('50%')
    .width('50%')
  }
}