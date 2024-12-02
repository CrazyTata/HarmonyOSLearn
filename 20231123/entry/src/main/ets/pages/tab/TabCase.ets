import { IGoodsItem, waterFlowData } from '../../mock/WaterFlowGoodsInfoData';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct TabCase {

  private controller: TabsController = new TabsController()

  @State currentIndex:number = 0

  @Builder menu(content:string,myIdx:number,imageUrl:string){
    Column({space:5}){

      Image((this.currentIndex===myIdx)?$rawfile(`tabsImg/${imageUrl}_select.png`): $rawfile(`tabsImg/${imageUrl}.png`),)
        .height(30)
        .aspectRatio(1)
      Text(content)
        .fontSize(14)
        .fontWeight(600)
    }
  }
  @State list:Array<IGoodsItem> = waterFlowData
  @State counter:number = 0

  @State action:boolean = false
  @Builder footerBuilder(){
    Row(){
      if (this.action){
        LoadingProgress().width(30)
          .aspectRatio(1)
        Text('数据加载中……')
          .fontColor(Color.White)
          .fontWeight(600)
      }else{
        Text('亲！到底了……')
          .fontColor(Color.White)
          .fontWeight(600)
      }

    }.height(50)
    .width('100%')
    .backgroundColor('#999')
    .justifyContent(FlexAlign.Center)
  }

  async  loadData(){
    return new Promise<boolean>((resolve,reject)=>{
      setTimeout(()=>{
        this.list.push(...waterFlowData)
        promptAction.showToast({message:'数据加载完成！'})
        resolve(true)
      },3000)
    })
  }

  build() {

    Column(){
      Tabs({barPosition:BarPosition.End}){
        TabContent(){
          Column(){
            Text('1')
              .fontColor(Color.White)
              .fontSize(30)
              .fontWeight(600)
          }.height('100%')
          .width('100%')
            .backgroundColor('#00CB87')
          .justifyContent(FlexAlign.Center)
        }.tabBar(this.menu('首页',0,'home'))
        TabContent(){
          Text('2')
        }.tabBar( this.menu("项目",1,'project'))

        TabContent(){
          Text('3')
        }.tabBar(this.menu('页经',2,'interview'))

        TabContent(){
          WaterFlow({footer:this.footerBuilder}){
            ForEach(waterFlowData,(goods:IGoodsItem,idx:number)=>{
              FlowItem(){
                Column({space:5}){
                  Image(goods.goods_img)
                    .height(idx% 2==0?200:300)
                  Text(goods.goods_name)
                    .maxLines(2)
                    .textOverflow({overflow:TextOverflow.Ellipsis})
                }
              }
            })

          }
          .onReachEnd(async ()=>{
            this.action = !this.action;
            await this.loadData()
            this.action = !this.action

          })
          .columnsTemplate('1fr 1fr')
          .columnsGap(5)
          .rowsGap(5)
          .padding(10)
          .width('100%')
          .height('100%')
        }.tabBar(this.menu('我的',3,'mine'))

      }.onChange((idx:number)=>{
        this.currentIndex = idx
      })
    }
    .height('100%')
    .width('100%')
  }
}