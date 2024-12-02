@Entry
@Component
struct PropCase1 {

  @State num:number = 0

  syncData=(s:number)=>{
    this.num=s
  }

  build() {
    Column({space:10}){
      Text(`父组件计算器：${this.num}`)
      Button('点击+1')
        .width(100)
        .height(50)
        .borderRadius(20)
        .onClick(()=>{
          this.num++
        })

      Divider()
        .color(Color.Gray)
        .width('100%')
        .strokeWidth(1)

      // myProp({num:this.num,f:(s:number)=>{
      //   this.num = s
      // }})

      myProp({num:this.num,f:this.syncData})
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct myProp{
  @Prop
  num:number;
  f:(s:number)=>void = this.myFun

  myFun(s:number) :void {}

  @State action:boolean = false

  build() {
    Column({space:10}){
      Text(`子组件计算器：${this.num.toString()}`)
      Button('点击+1')
        .width(80)
        .height(40)
        .borderRadius(15)
        .onClick(()=>{
          this.num++
          this.f(this.num)
        })
    }
  }
}