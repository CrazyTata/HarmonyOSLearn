@Entry
@Component
struct DocumentListPage {
  @State message: string = 'Hello World';

  build() {
    Navigation() {
      List() {
        ListItem() {
          RelativeContainer() {
            Column() {
              Image( $r( 'app.media.Document_User' ) )
                .width( 20 )
                .aspectRatio( 1 )
                .margin( { top: 4, left: 4, right: 4 } )
              Text( '档案' )
                .fontSize( 10 )
                .fontWeight( 400 )
                .fontColor( 0x4E5969 )
                .margin( { bottom: 4 } )
            }
            .alignRules( {
              center: { anchor: '__container__', align: VerticalAlign.Center },
              left: { anchor: '__container__', align: HorizontalAlign.Start }
            } )
            .id( 'icon' )
            .margin( { left: 16 } )
            .backgroundColor( 0xF2F3F5 )
            .borderRadius( 6 )

            Text( '王小明 小朋友' )
              .fontSize( 15 )
              .fontWeight( 600 )
              .fontColor( 0x1D2129 )
              .alignRules( {
                left: { anchor: 'icon', align: HorizontalAlign.End },
                top: { anchor: 'icon', align: VerticalAlign.Top },
                right: { anchor: '__container__', align: HorizontalAlign.End }
              } )
              .margin( { left: 16 } )

            Text( '男生・2020年4月7日出生・45月龄' )
              .fontSize( 12 )
              .fontWeight( 400 )
              .fontColor( 0x4E5969 )
              .alignRules( {
                left: { anchor: 'icon', align: HorizontalAlign.End },
                bottom: { anchor: 'icon', align: VerticalAlign.Bottom },
                right: { anchor: '__container__', align: HorizontalAlign.End }
              } )
              .margin( { left: 16 } )
          }
          .height( 74 )
          .borderWidth( 1 )
          .borderRadius( 12 )
          .borderColor( 0xf2f3f5 )
        }
      }
      .margin( { left: 12, right: 12 } )
    }
    .title( '档案列表' )
    .titleMode( NavigationTitleMode.Mini )
    .navBarPosition( NavBarPosition.End )
    .backButtonIcon( $r( 'app.media.Navbar_arrow_left' ) )
    .height( '100%' )
    .width( '100%' )
  }

  @Builder
  menuBuilder() {
    Row() {
      Image( $r( 'app.media.Attendance_Arrow_uc' ) )
        .width( 20 )
        .aspectRatio( 1 )
    }
    .height( '100%' )

  }
}