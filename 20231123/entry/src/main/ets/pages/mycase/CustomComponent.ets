// import {build,Produce,jsonToBean} from '../../common/CommonUtil';
// import { HeaderComponent } from '../../component/HeaderComponent';
// import { ProductListComponent } from '../../component/ProductListComponent';
import { IProduct,productInfo } from '../../mock/ProductInfo';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  private items:Array<IProduct> = productInfo;
  //面向对象改造
  private products:Array<IProduct> = productInfo;
  build() {
    Row() {
      Column({space:10}) {
        // HeaderComponent({title:'商品列表'})
        // ProductListComponent({products:this.products});
      }.justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
      .width('100%')
      .height('100%')
    }.backgroundColor('#eee')
    .height('100%')
  }
}