import { IGoodsItem, waterFlowData } from '../../mock/WaterFlowGoodsInfoData'
import { LoadingDialog, promptAction } from '@kit.ArkUI'

@Entry
@Component
struct WaterFlowCase {
  @State goods:Array<IGoodsItem> = waterFlowData

  dialogController : CustomDialogController = new CustomDialogController({
    builder:LoadingDialog({
      content: '数据加载中...'
    })
  })

 async getData(){
      return new Promise<Array<IGoodsItem>>((resolve, reject)=>{
          setTimeout(()=>{
            this.dialogController.close()

              resolve(waterFlowData)
          },2000)
      })
  }

  build() {
    WaterFlow(){
      ForEach(this.goods,(item:IGoodsItem,idx:number)=>{
        FlowItem(){
          Column({space:5}){
            Image(item.goods_img)
              .height(idx % 2 == 0 ? 300 : 200);
            Text(item.goods_name)
              .fontSize(20)
              .fontWeight(500)
              .maxLines(2)
              .textOverflow({overflow:TextOverflow.Ellipsis})
          }.margin(10)

        }
      })

    }.columnsTemplate('1fr 1fr')
    .rowsGap(10)
    .height('100%')
    .width('100%')
    .onReachEnd(async ()=>{
      this.dialogController.open()
      let  result = await  this.getData()
      this.goods.push(...result)
      promptAction.showToast({message:'加载成功'})
    })
  }
}