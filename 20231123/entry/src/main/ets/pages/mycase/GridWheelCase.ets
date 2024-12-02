import { awardInfo, IAward } from '../../mock/AwardInfo';

@Entry
@Component
struct GridWheelCase {

  goodsList:Array<IAward> = awardInfo

  @State action:boolean = false

  @State loopIndex:number = -1

  @State loopClock:number = 0

  @State result:string = ''
  clock(){
    if (this.loopIndex==this.goodsList.length-2){
      this.loopIndex = 0
    }else{
      this.loopIndex++
    }
  }

  getAward(){
    let idx:number = this.goodsList.findIndex((item:IAward)=>{
      return item.loop==this.loopIndex
    })
    this.result =  this.goodsList[idx].name
  }

  build() {
      Column(){
        Grid(){
        ForEach(this.goodsList,(item:IAward,idx:number)=> {
          if (item.image == undefined || item.image == '') {
            GridItem() {
              Row({ space: 5 }) {
                Column({ space: 5 }) {
                    Text(item.name)
                      .fontColor(Color.White)
                      .fontWeight(600)
                }.backgroundColor(Color.Blue)
                .height('20%')
                .backgroundColor('#36d')
                .borderRadius(10)
                .padding(5)
                .aspectRatio(1)
                .justifyContent(FlexAlign.Center)
                .onClick(()=>{
                  if (!this.action){
                    this.loopClock = setInterval(()=>{
                      this.clock()
                    },150)
                  }else{
                    this.getAward()
                    clearInterval(this.loopClock)
                  }
                  this.action = !this.action
                })
              }
            }
          } else {
          GridItem() {
            Column({ space: 5 }) {
                  Image(item.image)
                    .height(98)
                    .aspectRatio(1)
                Divider()
                  .strokeWidth(1)
                  Text(item.name)
                    .fontColor(Color.Black)
                    .fontWeight(300)

            }.backgroundColor((this.loopIndex==item.loop)?Color.Red:Color.White)
            .borderRadius(10)
          }
        }
        })
      }.columnsTemplate('1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .height('80%')
        .margin(8)
        if (this.result!=''){
          Text(`抽奖的结果是：${this.result}`)
            .backgroundColor(Color.White)
            .width('70%')
            .height('10%')
            .textAlign(TextAlign.Center)
        }

    }.justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Gray)
  }
}