import promptAction from '@ohos.promptAction'
import Item from '../mall/viewmodels/Item'
import { MProductItem } from './MProductItem'
@Entry
@Component
export default struct Home {

  // 商品数据
  private items: Array<Item> = [
    new Item('华为Mate70', $r('app.media.mate60'), 6999,3000,false,"王小","18125545656"),
    new Item('MateBookProX', $r('app.media.mateBookProX'), 13999,8000,false,"张先生","13800525445"),
    new Item('WatchGT4', $r('app.media.watchGT4'), 1438,600,false,"汪明","15925545656"),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'), 1499,1000,false,"李四","18125545656"),
    new Item('FreeBuds Pro3', $r('app.media.freeBudsPro3'), 1499,600,false,"王小","18125545656"),
    new Item('Mate X5', $r('app.media.mateX5'), 12999,7890,false,"吴三","13023156987")
  ]

  build() {
    Column({ space: 8 }) {
      Row() {
        Text('二手闲置交易平台')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(20)
      .margin({ bottom: 5,left:10 })


      List({space: 8}) {
        ForEach(
          this.items,
          (i: Item) => {
            ListItem(){
              MProductItem({item:i})
            }
          }
        )
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
  }

}

