@Entry
@Component
struct TabCase1 {
  @State currentIndex: number = 0;
  controller:TabsController = new TabsController()
  @Builder
  menu (title:string,image:string,index:number){
    Column(){
      Image((this.currentIndex == index)?$rawfile(`tabsImg/${image}_select.png`):$rawfile(`tabsImg/${image}.png`))
        .height(30)
        .aspectRatio(1)
      Text(title)
    }
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
  }

  build() {

      Tabs({barPosition:BarPosition.End,controller:this.controller,index:this.currentIndex}){
        TabContent(){
              Column(){
                  Text('首页')
                    .fontSize(30)
                    .fontWeight(600)
                    .textAlign(TextAlign.Center)
              }.width('100%')
              .height('100%')
              .backgroundColor(Color.Red)
              .justifyContent(FlexAlign.Center)
            }.tabBar(this.menu('首页','home',0))

        TabContent(){
          Column(){
            Text('项目')
              .fontSize(30)
              .fontWeight(600)
              .textAlign(TextAlign.Center)
          }.width('100%')
          .height('100%')
          .backgroundColor(Color.Orange)
          .justifyContent(FlexAlign.Center)
        }.tabBar(this.menu('项目','project',1))

        TabContent(){
          Column(){
            Text('聊天')
              .fontSize(30)
              .fontWeight(600)
              .textAlign(TextAlign.Center)
          }.width('100%')
          .height('100%')
          .backgroundColor(Color.Brown)
          .justifyContent(FlexAlign.Center)
        }.tabBar(this.menu('聊天','interview',2))

        TabContent(){
          Column(){
            Text('我的')
              .fontSize(30)
              .fontWeight(600)
              .textAlign(TextAlign.Center)
          }.width('100%')
          .height('100%')
          .backgroundColor(Color.Gray)
          .justifyContent(FlexAlign.Center)
        }.tabBar(this.menu('我的','mine',3))
    }
    .onChange((index:number)=>{
      this.currentIndex = index
    })
    .height('100%')
    .width('100%')
  }
}