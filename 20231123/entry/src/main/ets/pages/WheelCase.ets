import { awardInfo, IAward } from '../mock/AwardInfo'

@Entry
@Component
struct WheelCase {

  wheelList:Array<IAward> = awardInfo

  @State result:string=''
  @State currentIdx:number=-1

  loopIdx:number=0
  action:boolean=false

  getRandomNumber(min: number, max: number): number {

    let num= Math.floor(Math.random() * (max - min + 1)) + min;
    if (num==4){
      return this.getRandomNumber(min,max)
    }
    return num
  }

  clockwise(){
    if(this.currentIdx===7){
      this.currentIdx=0
    }else{
      this.currentIdx++
    }

  }

  getAward():string{
    let idx:number = this.wheelList.findIndex((item:IAward)=>{
      return item.loop == this.currentIdx
    })
    return this.wheelList[idx].name
  }

  build() {
    Column(){
      //奖品列表
      Grid(){
        ForEach(this.wheelList,(item:IAward,idx:number)=>{
          if (item.image==undefined){
            GridItem(){
              Column({space:5}){

                Text(item.name)
                  .fontColor(Color.White)
                  .fontWeight(600)
              }
              .padding(5)
              .justifyContent(FlexAlign.Center)
            }
            .height(150)
            .backgroundColor('#36d')
            .borderRadius(10)
            .onClick(()=>{
              //抽奖逻辑

              if (!this.action){
                //点击开始抽奖
                this.loopIdx = setInterval(()=>{
                  // this.currentIdx= this.getRandomNumber(0,this.wheelList.length-1)
                  // if (this.currentIdx>this.wheelList.length){
                  //   this.currentIdx=0
                  // }
                  // this.currentIdx++
                  this.clockwise()
                },100)

              }else{
                //再次点击完成结果输出停止抽奖
                this.result = this.getAward()
                  clearInterval(this.loopIdx)
              }

              this.action = !this.action
            })
          }else{
            GridItem(){
              Column({space:5}){

                  Image(item.image)
                    .height(100)
                    .aspectRatio(1)
                  Divider()
                    .strokeWidth(1)
                Text(item.name)
                  .fontColor(Color.Black)
                  .fontWeight(300)
              }
              .padding(5)
              .justifyContent(FlexAlign.Center)
            }
            .height(150)
            .backgroundColor((this.currentIdx===item.loop)?Color.Orange:Color.White)
            .borderRadius(10)
          }

        })

      }.columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .height('80%')
      if (this.result){
        Row(){
        Text(`中奖结果:${this.result}`)
          .width('80%')
          .fontSize(30)
          .fontColor(Color.Red)
          .fontWeight(600)
          .backgroundColor(Color.White)
      }.layoutWeight(1)
      }
    }
    .padding(10)
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Gray)
  }
}