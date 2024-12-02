import { webview } from '@kit.ArkWeb';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct WebviewWheel2 {
  controller:webview.WebviewController = new webview.WebviewController();
  build() {
    Column({space:10})
    {
    Button("点击抽奖")
      .margin(10)
      .onClick(()=>{
        //1.创建通讯端口
        let ports = this.controller.createWebMessagePorts();
        //2.创建监听事件
        ports[1].onMessageEvent((result)=>{
          //提示中奖结果
          promptAction.showToast({message:`中奖结果:${result}`});
        })

        //3.发送消息给HTML5侧
        this.controller.postMessage('',[ports[0]],'*');
        ports[1].postMessageEvent('start');

      });
    Web({
      src:$rawfile('turntable/index.html')
    ,controller:this.controller})
      .width('100%')
      .layoutWeight(1);
    }.width('100%')
    .height('100%')
  }
}