import { IProduct, productInfo } from '../../mock/ProductInfo';

@Extend(GridCol) function commonGridCol(

){
  .height(200)
  .width('100%')
  .backgroundColor(Color.White)
  .borderRadius(10)
}

@Builder function myFunction(): void {}
@Builder function myFunction1(content:string): void {}

@Component
struct topicComp{
  title:string='';
  moreString:string='';
  @BuilderParam
  more:(content:string)=>void = myFunction1
  @BuilderParam
  content:()=>void = myFunction

  build() {
    Column({space:10}){
      Row(){
        Text(this.title)
          .fontWeight(600)
        Row(){
         this.more(this.moreString)
        }.layoutWeight(1)
        .justifyContent(FlexAlign.End)
      }.width('100%')
      .padding(5)

      Divider()
        .strokeWidth(2)
        .color(Color.Orange)

      this.content()
    }

  }
}



@Entry
@Component
struct GridRowCase {

  @Builder topicBuilder(title:string){
  Row(){
    Text(title)
      .fontWeight(600)
    Row(){
      Text('查看更多>')
        .fontColor('#666')
      Image('')
        .width(24)
        .aspectRatio(1)
        .fillColor('#666')
    }
    }.width('100%')
  .justifyContent(FlexAlign.SpaceBetween)
  .padding(5)

}

@Builder moreBuild(content:string){
    Text(content)
      .fontColor('#666')
    Image('')
      .width(24)
      .aspectRatio(1)
      .fillColor('#666')
}

@Builder productListBuilder(){
    Column(){
      List({space:5}){
        ForEach(productInfo,(prod:IProduct)=>{
          ListItem(){
            Image(prod.image)
              .height(100)
              .aspectRatio(1)
          }
        })
      }.listDirection(Axis.Horizontal)
    }
    .justifyContent(FlexAlign.Center)
  .width('100%')
}


  @Builder newsListBuilder(){
    Column(){
      List({space:5}){
        ForEach(['aaa','bbb','ccc'],(str:string)=>{
          ListItem(){
            Text(str)
          }
        })
      }
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }


  build() {
    Column() {
      GridRow({ columns: 2,gutter:15 }) {

        GridCol({ span: 2 }) {
          topicComp({title:'评价（2000+）',moreString:'好评率 98%',more:this.moreBuild,content:this.productListBuilder})
        }.commonGridCol()

        GridCol({ span: 1 }) {
          topicComp({title:'推荐',moreString:'查看全部',more:this.moreBuild,content:this.newsListBuilder})

        }.commonGridCol()

        GridCol({ span: 1 }) {
          topicComp({title:'推荐',moreString:'查看全部',more:this.moreBuild,content:this.newsListBuilder})

        }.commonGridCol()
      }
      .backgroundColor('#e3e4e5')


    }.height('100%')
    .width('100%')
    .backgroundColor('#e3e4e5')
    .padding(10)
  }
}