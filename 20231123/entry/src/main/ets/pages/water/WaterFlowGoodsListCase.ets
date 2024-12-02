import { IGoodsItem, waterFlowData } from '../../mock/WaterFlowGoodsInfoData';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct WaterFlowGoodsListCase {

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
   }
}