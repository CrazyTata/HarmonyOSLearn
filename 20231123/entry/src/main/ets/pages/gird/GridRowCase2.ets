import List from '@ohos.util.List';
import { IProduct, productInfo } from '../../mock/ProductInfo';
@Entry
@Component
struct Index {
  @Builder
  MoreBuilder (title: string) {
    Row() {
      Text(title)
        .fontSize(14)
        .fontColor('#666666')
      // Image($r('app.media.ic_public_arrow_right'))
      Image('')
        .width(16)
        .fillColor('#666666')
    }
  }
  build() {
    Column() {
      GridRow({ columns: 2, gutter: 15 }) {
        GridCol({ span: 2 }) {
          Column() {
            Row() {
              Text('评价(2000+)') .layoutWeight(1) .fontWeight(600)
              this.MoreBuilder("评价 好评率 98%") }
            .padding(10)
            Row()
              .height(100)
          }
          .borderRadius(12)
          .backgroundColor('#fff')
        }
        GridCol() {
          Column() {
            Row() { Text('推荐')
              .layoutWeight(1)
              .fontWeight(600)
              this.MoreBuilder("推荐 查看全部")
            }
            .padding(10)
            Row()
              .height(100)
          }
          .borderRadius(12)
          .backgroundColor('#fff')
        }
        GridCol() {
          Column() {
            Row() { Text('体验')
              .layoutWeight(1)
              .fontWeight(600)
              this.MoreBuilder("体验 4 条测评")
            }
            .padding(10)
            Row()
              .height(100)
          }
          .borderRadius(12)
          .backgroundColor('#fff')
        }
      }
    }
    .height('100%')
    .padding(15)
    .backgroundColor('#f5f5f5')
  }
}