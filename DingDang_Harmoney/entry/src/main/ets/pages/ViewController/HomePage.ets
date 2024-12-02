import { router } from '@kit.ArkUI'
import { DDDocumentListModel } from '../../Model/DDDocumentListModel';
import {
  router_CreateDocumentPage1,
  router_DDCustomizedViewController,
  router_DocumentListPage,
  router_EvalutionViewController
} from '../../Tool/RouterFile';

@Entry
@Component
export struct HomePage {
  scroller: Scroller = new Scroller()
  @State isVip: boolean = true
  @State message: string = '创建档案后解锁完整内容'
  @Prop documentList: DDDocumentListModel
  @State isExpand: boolean = false

  build() {
    Stack() {
      RelativeContainer() {
        Scroll( this.scroller ) {
          Column( { space: 12 } ) {
            NavigationItem( )
              .id( 'NavigationItem' )
              .alignRules( {
                middle: { anchor: '__container__', align: HorizontalAlign.Center },
                top: { anchor: '__container__', align: VerticalAlign.Top },
              } )

            if (this.documentList.list.length == 0) {
              CreateDocumentView( { documentList: this.documentList } )
                .id( 'CreateDocumentView3' )
                .margin( { top: 10 } )
                .alignRules( {
                  top: { anchor: 'NavigationItem', align: VerticalAlign.Bottom },
                } )

              Text( this.message )
                .id( 'Text0' )
                .fontSize( 14 )
                .fontColor( 0x86909C )
                .margin( { top: 16 } )
                .alignRules( {
                  middle: { anchor: '__container__', align: HorizontalAlign.Center },
                  top: { anchor: 'CreateDocumentView3', align: VerticalAlign.Bottom },
                } )
            }

            TrainProgressView( {
              isVip: this.isVip,
              documentList: this.documentList
            } )

            FunctionButton( {
              title: '叮当评估',
              desc: '快速筛查与跟踪',
              icon: $r( 'app.media.Home_Icon_Evalution' ),
              color: 0xffffff
            } )
              .margin( { left: 16, right: 16 } )
              .onClick( () => {
                let option: router.RouterOptions = {
                  url: router_EvalutionViewController
                }
                router.pushUrl( option )
              } )

            FunctionButton( {
              title: '定制练习',
              desc: '小叮当独家定制',
              icon: $r( 'app.media.Home_Icon_Train' ),
              color: 0xFADC19
            } )
              .margin( { left: 16, right: 16 } )
              .onClick( () => {
                let option: router.RouterOptions = {
                  url: router_DDCustomizedViewController
                }
                router.pushUrl( option )
              } )
          }
        }
        .scrollBar( BarState.Off )
        .height( '100%' )

        // RelativeContainer() {
        //   Button( '+' ).onClick( (event: ClickEvent) => {
        //     this.isExpand = !this.isExpand
        //   } )
        //     .id( 'btn1' )
        //     .alignRules( {
        //       right: { anchor: '__container__', align: HorizontalAlign.End },
        //       bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        //     } )
        //
        //   if (this.isExpand) {
        //     Button( '1' ).onClick( (event: ClickEvent) => {
        //
        //     } )
        //       .id( 'btn2' )
        //       .alignRules( {
        //         right: { anchor: 'btn1', align: HorizontalAlign.End },
        //         bottom: { anchor: 'btn1', align: VerticalAlign.Top }
        //       } )
        //       .margin( { bottom: 12 } )
        //
        //     Button( '2' ).onClick( (event: ClickEvent) => {
        //
        //     } )
        //       .id( 'btn3' )
        //       .alignRules( {
        //         right: { anchor: 'btn1', align: HorizontalAlign.Start },
        //         bottom: { anchor: 'btn1', align: VerticalAlign.Top }
        //       } )
        //
        //     Button( '3' ).onClick( (event: ClickEvent) => {
        //
        //     } )
        //       .id( 'btn4' )
        //       .alignRules( {
        //         right: { anchor: 'btn1', align: HorizontalAlign.Start },
        //         bottom: { anchor: 'btn1', align: VerticalAlign.Bottom }
        //       } )
        //       .margin( {
        //         right: 12
        //       } )
        //   }
        //
        // }
        // .alignRules( {
        //   right: { anchor: '__container__', align: HorizontalAlign.End },
        //   bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        // } )
        // .onClick( () => {
        //   this.isExpand = !this.isExpand
        // } )
        // .width( this.isExpand ? '100%' : 50 )
        // .height( this.isExpand ? '100%' : 50 )

        // .backgroundColor()
      }
    }
  }
}

@Component
struct NavigationItem {
  build() {
    // 根节点唯一且必要，必须为容器组件
    RelativeContainer() {
      Image( $r( 'app.media.Document_User' ) )
        .width( 20 )
        .height( 20 )
        .margin( { left: 20 } )
        .alignRules( {
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          top: { anchor: '__container__', align: VerticalAlign.Top },
        } )

      Image( $r( 'app.media.Document_User' ) )
        .width( 20 )
        .height( 20 )
        .margin( { right: 20 } )
        .alignRules( {
          right: { anchor: '__container__', align: HorizontalAlign.End },
          top: { anchor: '__container__', align: VerticalAlign.Top },
        } )
        .onClick( () => {
          let option: router.RouterOptions = {
            params: { "": "" },
            url: router_DocumentListPage
          }
          router.pushUrl( option )
        } )
    }
    .width( '100%' )
    .height( 24 )
  }
}

@Component
struct CreateDocumentView {
  @Prop documentList: DDDocumentListModel

  build() {
    if (this.documentList.list.length == 0) {
      Column() {
        Image( $r( 'app.media.Document_User' ) )
          .id( 'Image1' )
          .width( 20 )
          .height( 20 )
          .margin( { left: 20, top: 20 } )

        Text( '创建档案' )
          .id( 'Text0' )
          .margin( { top: 4, left: 20 } )
          .fontWeight( 600 )
          .fontSize( 18 )
          .fontColor( 0x1D2129 )

        Text( '为您的孩子创建档案' )
          .id( 'Text1' )
          .margin( { top: 4, left: 20 } )
          .fontWeight( 400 )
          .fontSize( 14 )
          .fontColor( 0x86909C )

        Button( { type: ButtonType.Normal } ) {
          RelativeContainer() {
            Text( '立即创建' )
              .id( 'Text2' )
              .margin( { left: 20 } )
              .alignRules( {
                left: { anchor: '__container__', align: HorizontalAlign.Start },
                center: { anchor: '__container__', align: VerticalAlign.Center },
              } )
              .fontColor( Color.White )
              .fontSize( 14 )
              .fontWeight( 600 )

            Image( $r( 'app.media.Document_Arrow_Right' ) )
              .id( 'Image2' )
              .width( 20 )
              .height( 20 )
              .margin( { right: 12 } )
              .alignRules( {
                right: { anchor: '__container__', align: HorizontalAlign.End },
                center: { anchor: '__container__', align: VerticalAlign.Center },
              } )
          }
        }
        .id( 'Button0' )
        .height( 40 )
        .margin( {
          left: '5%',
          top: 20,
          right: '5%',
          bottom: 20
        } )
        .borderRadius( 12 )
        .onClick( () => {
          let option: router.RouterOptions = {
            url: router_CreateDocumentPage1
          }
          router.pushUrl( option )
        } )
        .width( '90%' )
      }
      .alignItems( HorizontalAlign.Start )
      .backgroundColor( Color.White )
      .margin( { left: '5%', right: '5%' } )
      .width( '90%' )
      .borderRadius( 24 )
    }
  }
}

@Component
struct TrainProgressView {
  @State titleList: String[] =
    ['玩耍', '语言理解', '语言表达', '情绪', '社交能力', '自主学习', '行为', '大运动', '精细运动']
  @Prop isVip: boolean = false
  @Prop documentList: DDDocumentListModel

  constructor(isVip: boolean, documentList: DDDocumentListModel) {
    super( )
    this.isVip = isVip
    this.documentList = documentList
    this.build( )
  }

  build() {
    Column() {

      if (this.documentList.list.length != 0) {
        Row() {
          Image( $r( 'app.media.Document_User' ) )
            .width( 12 )
            .aspectRatio( 1 )
          Text( this.documentList.list[0].name )
            .fontWeight( 600 )
            .fontSize( 12 )
            .fontColor( 0x86909C )
        }
        .backgroundColor( 0xf2f3f5 )
        .margin( { top: 20, left: 20 } )
        .padding( {
          // top: 6,
          // bottom: 6,
          left: 8,
          right: 8
        } )
        .height( 30 )
        .borderRadius( 10 )
      }

      Grid() {
        ForEach( this.titleList, (title: string) => {
          GridItem() {
            RelativeContainer() {
              this.buildView( this.isVip, title )
            }
            .aspectRatio( 100 / 80 )
            .backgroundColor( this.isVip == true ? 0xE8F3FF : 0xF7F8FA )
            .borderRadius( 16 )
          }
        } )
      }
      .margin( {
        left: 16,
        right: 16,
        bottom: 16,
        top: this.documentList.list.length != 0 ? 12 : 16
      } )
      .columnsGap( 4 )
      .rowsGap( 4 )
      .columnsTemplate( '1fr 1fr 1fr' )
      .backgroundColor( Color.White )

      Text( '今日暂无打卡' )
        .backgroundColor( 0xF7F8FA )
        .fontColor( 0xc9cdd4 )
        .width( '90%' )
        .textAlign( TextAlign.Center )
        .fontSize( 12 )
        .height( 33 )
        .borderRadius( 14 )
        .margin( { left: '5%', right: '5%' } )

      Button( { type: ButtonType.Normal } ) {
        RelativeContainer() {
          Text( '立即打卡' )
            .id( 'Text2' )
            .margin( { left: 20 } )
            .alignRules( {
              left: { anchor: '__container__', align: HorizontalAlign.Start },
              center: { anchor: '__container__', align: VerticalAlign.Center },
            } )
            .fontColor( Color.White )
            .fontSize( 14 )
            .fontWeight( 600 )

          Image( $r( 'app.media.Document_Arrow_Right' ) )
            .id( 'Image2' )
            .width( 20 )
            .height( 20 )
            .margin( { right: 12 } )
            .alignRules( {
              right: { anchor: '__container__', align: HorizontalAlign.End },
              center: { anchor: '__container__', align: VerticalAlign.Center },
            } )
        }
      }
      .borderRadius( 14 )
      .margin( 16 )
      .width( '90%' )
      .height( 48 )
      .backgroundColor( this.isVip == true ? 0x165DFF : 0xC9CDD4 )

    }
    .backgroundColor( Color.White )
    .margin( { top: 16 } )
    .width( '90%' )
    .borderRadius( 24 )
    .alignItems( HorizontalAlign.Start )
  }

  getSource(title: string, isUnlock: boolean) {
    switch (title) {
      case '玩耍':
        return $r( isUnlock == true ? 'app.media.Attendance_Area1' : 'app.media.Attendance_Area1_uc' )
      case '语言理解':
        return $r( isUnlock == true ? 'app.media.Attendance_Area2' : 'app.media.Attendance_Area2_uc' )
      case '语言表达':
        return $r( isUnlock == true ? 'app.media.Attendance_Area3' : 'app.media.Attendance_Area3_uc' )
      case '情绪':
        return $r( isUnlock == true ? 'app.media.Attendance_Area4' : 'app.media.Attendance_Area4_uc' )
      case '社交能力':
        return $r( isUnlock == true ? 'app.media.Attendance_Area5' : 'app.media.Attendance_Area5_uc' )
      case '自主学习':
        return $r( isUnlock == true ? 'app.media.Attendance_Area6' : 'app.media.Attendance_Area6_uc' )
      case '行为':
        return $r( isUnlock == true ? 'app.media.Attendance_Area7' : 'app.media.Attendance_Area7_uc' )
      case '大运动':
        return $r( isUnlock == true ? 'app.media.Attendance_Area8' : 'app.media.Attendance_Area8_uc' )
      case '精细运动':
        return $r( isUnlock == true ? 'app.media.Attendance_Area9' : 'app.media.Attendance_Area9_uc' )
      default:
        return $r( isUnlock == true ? 'app.media.Attendance_Area1' : 'app.media.Attendance_Area1_uc' )
    }
  }

  @Builder
  buildView(isVip: boolean, title: string) {
    Image( this.getSource( title, isVip ) )
      .id( 'Image1' )
      .margin( { top: 14, left: 14 } )
      .width( 24 )
      .alignRules( {
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        top: { anchor: '__container__', align: VerticalAlign.Top },
      } )
    Text( title )
      .fontSize( 16 )
      .fontWeight( 600 )
      .fontColor( this.isVip == true ? 0x1D2129 : 0xC9CDD4 )
      .alignRules( {
        top: { anchor: 'Image1', align: VerticalAlign.Bottom },
        left: { anchor: 'Image1', align: HorizontalAlign.Start },
      } )
      .margin( { top: 6 } )
    Image( $r( isVip ? 'app.media.Attendance_Arrow_c' : 'app.media.Attendance_Arrow_uc' ) )
      .margin( { top: 12, right: 12 } )
      .width( 12 )
      .alignRules( {
        right: { anchor: '__container__', align: HorizontalAlign.End },
        top: { anchor: '__container__', align: VerticalAlign.Top },
      } )
  }
}

@Component
struct FunctionButton {
  @Prop title: string
  @Prop desc: string
  @Prop icon: Resource
  @Prop color: Color

  build() {
    RelativeContainer() {
      Column() {
        Text( this.title )
          .fontSize( 18 )
          .fontWeight( 600 )
          .fontColor( 0x1D2129 )
        Text( this.desc )
          .fontSize( 13 )
          .fontWeight( 400 )
          .fontColor( 0x4E5969 )
      }
      .margin( { left: 24 } )
      .alignItems( HorizontalAlign.Start )
      .alignRules( {
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        center: { anchor: '__container__', align: VerticalAlign.Center }
      } )

      Image( this.icon )
        .alignRules( {
          right: { anchor: '__container__', align: HorizontalAlign.End },
          top: { anchor: '__container__', align: VerticalAlign.Top },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        } )
    }
    .backgroundColor( this.color )
    .borderRadius( 20 )
    .height( 80 )
  }
}