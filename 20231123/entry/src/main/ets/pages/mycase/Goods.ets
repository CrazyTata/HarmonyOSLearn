import { IProduct, productInfo } from '../../mock/ProductInfo';
import { LoadingDialog, promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Goods {
  @State message: string = 'Hello World';

  @State goodsList:Array<IProduct> = productInfo

  lock:number=0

  dialogControllerProgress:CustomDialogController= new CustomDialogController({
    builder:LoadingDialog({
      content: '数据加载中...'
    })
  })

  async loadData (){
    return new Promise<boolean>((resolve,reject)=>{
        setTimeout(()=>{
            this.goodsList.push(...productInfo)
          this.lock=0
          this.dialogControllerProgress.close()
          resolve(true)
        },3000)
    })

}

  build() {
    Column({space:5}){
      Text('商品列表')
        .width('100%')
        .fontSize(30)
        .padding(10)
        .fontWeight(600)

      List({space:5}){
        ForEach(this.goodsList,(item:IProduct,idx:number)=>{
          ListItem(){
            Row(){
              Image(item.image)
                .height(100)
                .aspectRatio(1)
              Column({space:3}){

                Text(`${item.name}`)
                  .fontWeight(600)

                if (item.discount ==undefined || item.discount==0){
                  Text(`¥ ${item.price}`)
                    .fontWeight(600)
                    .fontColor(Color.Red)
                }else{
                  Text(`¥ ${item.price}`)
                    .fontWeight(600)
                    .fontColor(Color.Gray)
                    .decoration({type:TextDecorationType.LineThrough})

                  Text(`直降¥ ${item.price-item.discount}`)
                    .fontWeight(600)
                    .fontColor(Color.Red)

                  Text(`¥ ${item.discount}`)
                    .fontWeight(600)
                    .fontColor(Color.Red)
                }

              }.alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
              .height(90)
              .padding({left:10})

            }.backgroundColor(Color.White)
            .height(100)
            .layoutWeight(1)
            .borderRadius(15)
          }
        })
      }.height('90%')
      .onReachEnd(async ()=>{
        this.lock++
        if (this.lock==2){
          this.dialogControllerProgress.open()
          let result = await this.loadData()
          promptAction.showToast({message:result?'加载成功':'加载失败'})
        }
      })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Pink)
    .padding(1)
  }
}