import { LoadingDialog, promptAction } from '@kit.ArkUI'
import { it } from '@ohos/hypium'
import { IProduct, productInfo } from '../mock/ProductInfo'

@Entry
@Component
struct ProductListCase {

  dialogControllerProgress: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({
      content: '数据加载中...',
    }),
  })

 @State list:Array<IProduct> = productInfo
  lock:number = 0;

  async  loadData(){
    return new Promise<boolean>((resolve,reject)=>{
      setTimeout(()=>{
        this.list.push(...productInfo)
        this.lock = 0;
        this.dialogControllerProgress.close();
        resolve(true)
      },3000)
    })
  }


  build() {
   Column(){
     //标题
     Row(){
       Text('商品列表')
         .fontSize(30)
         .fontWeight(600)
     }.width('100%')
     .padding(10)

     //列表
     List({space:10}){

       ForEach(this.list,(item:IProduct,idx:number)=>{
         ListItem(){
           Row({space:10}){
             Image(item.image)
               .height(100)
               .aspectRatio(1)
             //当产品有折扣价，显示折扣价，删除原价，展示优惠力度
             Column({space:10}){
               Text(item.name)
                 .fontWeight(600)

               if (item.discount==undefined|| item.discount===0){
                 Text(`￥ ${item.price}`)
                   .fontWeight(600)
                   .fontColor(Color.Red)
               }else{

                 Text(`￥ ${item.discount}`)
                   .fontWeight(600)
                   .fontColor(Color.Gray)
                   .decoration({type:TextDecorationType.LineThrough})

                 Text(`直降:${item.price-item.discount}`)
                   .fontWeight(600)
                   .fontColor(Color.Red)

                 Text(`￥ ${item.discount}`)
                   .fontWeight(600)
                   .fontColor(Color.Red);
               }


             }.alignItems(HorizontalAlign.Start)
             .layoutWeight(1)
             .height(100)

           }
           .borderRadius(10)
           .padding(10)
           .width('100%')
           .backgroundColor(Color.White)
         }

       },(item:IProduct)=>{
         return item.id
       })


     }.padding('5%')
     .onReachEnd(async  ()=>{
       this.lock++;
       if(this.lock === 2) {
         this.dialogControllerProgress.open();
         let result = await this.loadData();
         promptAction.showToast({ message: result ? '数据加载成功' : '加载失败' })
       }
     })
   }

   .backgroundColor('#e3e4e5')
    .height('100%')
    .width('100%')
  }
}