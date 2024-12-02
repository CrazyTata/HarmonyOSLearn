import { IProduct, productInfo } from '../../mock/ProductInfo';

@Extend(GridCol) function commonGridCol()
{
  .width('100%')
  .height(200)
  .backgroundColor(Color.White)
  .borderRadius(10)
}
@Builder function MyBuilderFunction(): void {}
@Builder function MyBuilderFunction1(content:string): void {}
@Component
struct topicComp
{
  title:string = '';

  moreStr:string = '';

  @BuilderParam
  more:(content:string) => void = MyBuilderFunction1;

  @BuilderParam
  content:()=> void = MyBuilderFunction;

  build() {
    Column({space:10})
    {
      Row()
      {
        Text(this.title)
          .fontWeight(600)
        Row() {
          this.more(this.moreStr);
        }.layoutWeight(1)
        .justifyContent(FlexAlign.End)

      }.width('100%')
      .padding(5)
      Divider()
        .strokeWidth(2)
        .color(Color.Orange)

      this.content();
    }

  }
}

let newsList:Array<string> = ['新闻1','新闻2','新闻3'];

@Entry
@Component
struct GridRowCase {

  @State message: string = 'Hello World';

  //@State newsList111:Array<string> = ['新闻1','新闻2','新闻3'];

  @Builder topicBuilder(title:string)
  {
    Row()
    {
      Text(title)
        .fontWeight(600)
      Row() {
        Text('查看更多>')
          .fontColor('#666')
      }.layoutWeight(1)
      .justifyContent(FlexAlign.End)

    }.width('100%')
    .padding(5)
  }

  @Builder moreBuild(content:string)
  {
    Text(content)
      .fontColor('#666')
  }


  @Builder prodListBuilder()
  {
    Column()
    {
      List({space:5})
      {
        ForEach(productInfo,(prod:IProduct)=>{
          ListItem()
          {
            Image(prod.image).height(100).aspectRatio(1);
          }

        })

      }.listDirection(Axis.Horizontal)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }

  @Builder newsListBuilder()
  {
    Column()
    {

      List({space:5})
      {
        ForEach(newsList,(news:string)=> {
          ListItem() {
            Text(news);
          }
        });
      }

    } .justifyContent(FlexAlign.Center)
    .width('100%')

  }

  build() {
     Column()
     {
       GridRow({columns:2,gutter:15})
       {
         GridCol({span:2})
         {
           //this.topicBuilder('评价（2000+）');
           topicComp({title:'评价（2000+）',moreStr:'好评率 98%',more:this.moreBuild,content:this.newsListBuilder})

         }.commonGridCol();


         GridCol({span:1})
         {

           topicComp({title:'推荐',moreStr:'查看全部',more:this.moreBuild,content:this.prodListBuilder})

         }.commonGridCol();

         GridCol({span:1})
         {
           //this.topicBuilder('体验');

           // topicComp({title:'体验'})
           // {
           //   Text('4条测评')
           //     .fontColor('#666')
           //   Image($r('app.media.ic_public_arrow_right'))
           //     .width(24)
           //     .aspectRatio(1)
           //     .fillColor('#666')
           // }

         }.commonGridCol();
       }
     }.width('100%')
    .height('100%')
    .backgroundColor('#ccc')
    .padding(10)
  }
}