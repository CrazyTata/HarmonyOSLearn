@Entry
@Component
struct PropLinkCase {
  @State message: string = '103教室';

  build() {
    Column({space:16}){
      Text(this.message)
        .testStyle()//0-700

      Button('改变初始值:message')
        .onClick(()=>{
          this.message = this.message==='103教室'?'龙岗班级':'103教室'
        })

      Divider()

      PropCase({propMassage:this.message})

      Divider()

      LinkCase({linkMassage:this.message})
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct PropCase {
  //可以默认值
  @Prop propMassage:string='默认'
  build() {
    Column(){
      Text(this.propMassage)
        .testStyle()

      Button('改变Prop装束的数据')
        .onClick(()=>{
          this.propMassage='ArkTs语言'
        })
    }
  }
}

@Component
struct LinkCase {
  //不可以默认值
  @Link linkMassage:string
  build() {
    Column(){
      Text(this.linkMassage)
        .testStyle()

      Button('改变Prop装束的数据')
        .onClick(()=>{
          this.linkMassage='鸿蒙应用开发'
        })
    }
  }
}

@Extend(Text)
function testStyle() {
  .fontSize(25)
  .fontWeight(400)
}
