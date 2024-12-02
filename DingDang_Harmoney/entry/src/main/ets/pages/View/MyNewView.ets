@Component
export struct MyNewView {
  @State message: string = 'Hello, World!';
  @State imageSource: string =
    'https://s2.51cto.com/images/blog/front/202404/38b5c5117a7efe015c7298f1d01eaa9ce2196f.jpg?x-oss-process=image/watermark,size_14,text_QDUxQ1RP5Y2a5a6i,color_FFFFFF,t_30,g_se,x_10,y_10,shadow_20,type_ZmFuZ3poZW5naGVpdGk=,x-oss-process=image/resize,m_fixed,w_1184'

  build() {

    Column() {
      Blank( )
        .height( 100 )
      Column( { space: 10 } ) {
        Image( this.imageSource )
          .renderMode( ImageRenderMode.Original )
          .objectFit( ImageFit.Auto )
          .aspectRatio( 2 )
          .width( '90%' )
          .onClick( () => {
            this.imageSource =
              'https://www.510flash.com/upload/image/article/20230603/ce067f9c99324f4f0cfa65a78b0f2928.jpeg'
          } )

        Text( this.message )
          .onClick( () => {
            // 状态变量message的改变驱动UI刷新，UI从'Hello, World!'刷新为'Hello, ArkUI!'
            this.message = 'Hello, ArkUI!';
          } )
          .height( 30 )
          .id( '123' )

        RelativeContainer() {


          Button( '111111' )
            .onClick( () => {
              this.message = '123'
            } )// .aspectRatio(2)
            .margin( '10%' )
            .width( '80%' )
          // .alignRules({
          //   middle: { anchor: '__container__',align:HorizontalAlign.Center}
          // //   lef
          // })
        }

      }
    }
  }
}