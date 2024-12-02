import { router } from '@kit.ArkUI';
import { CommunicationPage } from './communication/CommunicationPage';
import { DiscoverPage } from './discover/DiscoverPage';
import { MessagesPage } from './message/MessagesPage';
import { PersonPage } from './person/PersonPage';

// let params = router.getParams() as Record<string,string>
// let userName = params['name']

class TabBar{
  title: string
  icon: ResourceStr

  constructor(title: string, icon: ResourceStr) {
    this.title = title
    this.icon = icon
  }

}

@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0

  mController: TabsController = new TabsController()

  tabList:TabBar[] = [
    new TabBar('联系人', $r('app.media.tab_button_communication_icon')),
    new TabBar('信息', $r('app.media.tab_button_messages_icon')),
    new TabBar('新闻', $r('app.media.tab_button_discover')),
    new TabBar('我的', $r('app.media.tab_button_person_icon'))
  ]
  //底部导航的样式
  @Builder TabBarItem(title:string,icon:ResourceStr,idx:number){
    // 如果由@Builder装饰，就不需要写方法build
    Column({space:5}){
      Image(icon)
        .width(30)
        .height(30)
        .objectFit(ImageFit.Contain)
        //设置图片的颜色填充,只有svg后缀的可以改图片颜色
        .fillColor((idx===this.currentIndex)?$r('app.color.tab_home_blue'):$r('app.color.tab_home_gray'))
      Text(title)
        .fontSize(20)
        .fontColor((idx===this.currentIndex)?$r('app.color.tab_home_blue'):$r('app.color.tab_home_gray'))
    }.onClick(()=>{
      this.currentIndex = idx
      this.mController.changeIndex(this.currentIndex)
    })
    .justifyContent(FlexAlign.Center)
  }


  build() {
    //底部导航，Tabs: 一个标签对应一个页面，主要是三到五个主模块
    Tabs({barPosition:BarPosition.End,controller:this.mController}){
      ForEach(this.tabList,(item:TabBar,idx:number)=>{
        TabContent(){
          if (idx===0){
            CommunicationPage()
          }else if (idx===1){
            MessagesPage()
          }else if (idx===2){
            DiscoverPage()
          }else if (idx===3){
            PersonPage()
          }
        }.tabBar(this.TabBarItem(item.title,item.icon,idx))
      })
    }.onChange((index:number)=>{
      this.currentIndex = index
    })
    .scrollable(false)
    .barHeight(60)
  }
}