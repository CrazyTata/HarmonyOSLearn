import { IGoodsItem, waterFlowData } from '../../mock/WaterFlowGoodsInfoData'

@Entry
@Component
struct SwiperCase {
  private swiperController: SwiperController = new SwiperController()
  private data: Array<IGoodsItem> = waterFlowData

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        ForEach(this.data, (item: IGoodsItem,idx:number) => {
          Column(){
            Image(item.goods_img)
              .height('80%')
              .width('95%')

            Text(item.goods_name)
              .width('95%')
              .height(80)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
              .maxLines(2)
              .textOverflow({overflow:TextOverflow.Ellipsis})
          }


          })

      }
      .cachedCount(2)
      .index(1)
      .autoPlay(false)
      .interval(4000)
      .loop(true)
      .indicatorInteractive(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: number) => {

      })


      Row({ space: 12 }) {

        Button('showPrevious')
          .onClick(() => {
            this.swiperController.showPrevious()
          })

        Button('showNext')
          .onClick(() => {
            this.swiperController.showNext()
          })
      }.margin(5)
    }.width('100%')
    .margin({ top: 5 })
  }
}