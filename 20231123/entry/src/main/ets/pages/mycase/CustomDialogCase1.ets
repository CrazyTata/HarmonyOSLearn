@CustomDialog
@Entry
@Component
struct CustomDialogCase1 {

  @State imageWidth:number=200

  customerDialog:CustomDialogController = new CustomDialogController({
    builder:CustomDialogCase1({imageWidth:400}),
    autoCancel:true
  })

  build() {
    Column(){
      Image($rawfile('mate60.png'))
        .width(this.imageWidth)
        .aspectRatio(1)
        .onClick(()=>{
            this.customerDialog.open()
        })
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
    .width('100%')
  }
}