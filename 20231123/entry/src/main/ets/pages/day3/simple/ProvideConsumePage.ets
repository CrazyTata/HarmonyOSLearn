@Entry
@Component
struct ProvideConsumePage {
  @Provide message:string = '103鸿蒙应用'

  build() {
    Column({space:10}){
      Text(this.message)
        .fontSize(20)
        .onClick(()=>{
          this.message= 'bb'
      })

      Divider()

      ProvideConsumePageSon()


    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct ProvideConsumePageSon {

  build() {
    Column({space:10}){
      Text('儿子')
        .fontSize(20)

      Divider()

      ProvideConsumePageSun()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct ProvideConsumePageSun {
  @Consume message :string
  build() {
    Column({space:10}){
      Text(this.message)
        .fontSize(20)
        .onClick(()=>{
          this.message= '孙子'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}