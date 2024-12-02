@Entry
@Component
struct WatchCase {
  @State @Watch('change') count: number = 1

  @State @Watch('change') pow:number = 2

  @State result:number = 1

  change(){
    this.result = Math.pow(this.count,this.pow)
  }

  build() {
    Column(){
      Text('基数' + this.count)
        .TextExtendStyle()
        .onClick(()=>{
          this.count++
        })
      Divider()

      Text('次幂' + this.pow)
        .TextExtendStyle()
        .onClick(()=>{
          this.pow++
        })
      Divider()

      Text(`结果${this.result}`)
        .TextExtendStyle()

    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Extend(Text)
function TextExtendStyle() {
  .fontSize(20)
  .fontWeight(500)
}
