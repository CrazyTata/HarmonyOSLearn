import { IGoodsItem, waterFlowData } from '../../mock/WaterFlowGoodsInfoData';

let imagesData:Array<IGoodsItem> = waterFlowData
@Styles function imageStyle(){
  .width('48%')
  .aspectRatio(1)
  .margin(5)
}

@Entry
@Component
struct PropCase2 {
  @State show:boolean = false

  @State selectData:Array<IGoodsItem> =[]

    build() {
    Column({space:10}){
      Button('选择图片')
        .width(200)
        .height(50)
        .buttonStyle(ButtonStyleMode.EMPHASIZED)
        .onClick(()=>{
          this.show =  !this.show
        })
      if (this.show){
        son({close:()=>{
          this.show = false
        },doSelectData:(selectData1:IGoodsItem)=>{
          this.selectData.push(selectData1)
        },cancel:()=>{
          this.selectData=[]
        }})
      }else{
        if (this.selectData.length>0){
          waterFlowComponent({showData:this.selectData})
        }
      }

    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct son{

  close:()=>void=()=>{};
  cancel:()=>void=()=>{};

  doSelectData:(selectData1:IGoodsItem)=>void=()=>{}

  build() {
    Column(){
      WaterFlow(){
        ForEach(imagesData,(item:IGoodsItem,idx:number)=>{
          FlowItem(){
            Image(item.goods_img)
              .imageStyle()
              .onClick(()=>{
                this.doSelectData(item)
              })
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .height('80%')
      .width('100%')

      Row({space:50}){
        Button('取消选择')
          .width(100)
          .onClick(()=>{
            this.cancel()
          })

        Button('确认')
          .width(100)
          .onClick(()=>{
            this.close()
          })


      }.margin({top:20})

    }.height('100%')
    .width('100%')

  }
}


@Component
struct waterFlowComponent{
  @Prop showData:Array<IGoodsItem>

  build() {
    WaterFlow(){
      ForEach(this.showData,(item:IGoodsItem,idx:number)=>{
        FlowItem(){
          Image(item.goods_img)
            .imageStyle()
        }
      })
    }
    .columnsTemplate('1fr 1fr')
    .height('100%')
    .width('100%')
  }
}