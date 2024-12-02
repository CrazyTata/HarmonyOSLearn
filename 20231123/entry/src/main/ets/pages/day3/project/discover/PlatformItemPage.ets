import { PlatformBaseData } from '../base/PlatformBase'


@Component
export struct PlatformItemPage {

  @Prop platformItem:PlatformBaseData


  build() {
    Row({space:10}){
      Image(this.platformItem.pic)
        .width(50)
        .height(50)
      //占位图 一般耗时操作需要
        .alt($r('app.media.github_logo_icon'))
      Column(){
        Text(this.platformItem.title)
          .itemTextStyle(20,500,1)

        Text(this.platformItem.desc)
          .itemTextStyle(15,300,2)
      }
      .alignItems(HorizontalAlign.Start)
      .width('80%')

    }
    .width('95%')
    .padding(10)
    .borderRadius(10)
    .backgroundColor(Color.White)
  }
}

@Extend(Text)
function itemTextStyle(size:number,weight:number,lines:number) {
  .fontSize(size)
  .fontWeight(weight)
  .maxLines(lines)
  .textAlign(TextAlign.Start)
  .textOverflow({overflow:TextOverflow.Ellipsis})
  .width('100%')
}
