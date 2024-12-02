import { XTDataManager } from "../../../Tool/XTDataManager";
import { router } from "@kit.ArkUI";
import {
  router_LoginViewController,
  router_ServiceViewController,
  router_VIPPurchaseViewController
} from "../../../Tool/RouterFile";
import { DDUserInfoModel } from "../../../Model/DDUserInfoModel";

enum DDMenuType {
  Report = 0,
  VIP,
  Mobile,
  Name,
  About,
  Privacy,
  Service,
  Cancellation,
  Logout
}

@Component
@Entry
export struct AccountViewController {
  @State message: string = 'Hello World';
  @State source: DDMenuType[][] =
    [[DDMenuType.Report], [DDMenuType.VIP],
      [DDMenuType.Mobile, DDMenuType.Name],
      [DDMenuType.About, DDMenuType.Privacy, DDMenuType.Service], [DDMenuType.Cancellation, DDMenuType.Logout]]
  @State mobile: string = ''
  @State remain: number = 0
  // @Link userInfo: DDUserInfoModel
  @State userInfo: DDUserInfoModel = new DDUserInfoModel()

  build() {

    Navigation() {
      List( { space: 12 } ) {
        ForEach( this.source, (list: DDMenuType[]) => {
          ListItemGroup() {
            ForEach( list, (item: DDMenuType) => {
              ListItem() {
                if (item == DDMenuType.Report) {
                  Column( { space: 12 } ) {
                    RelativeContainer() {
                      Text( '我的报告' )
                        .id( 'text' )
                        .fontSize( 18 )
                        .fontColor( Color.White )
                        .margin( { top: 16, left: 24 } )

                      Text( '评估结果与目标' )
                        .id( 'text1' )
                        .fontColor( Color.White )
                        .opacity( 0.5 )
                        .alignRules( {
                          top: { anchor: 'text', align: VerticalAlign.Bottom },
                        } )
                        .margin( { left: 24 } )

                      Text( '0' )
                        .fontSize( 10 )
                        .backgroundColor( Color.Red )
                        .textAlign( TextAlign.Center )
                        .padding( { left: 4, right: 4 } )
                        .alignRules( {
                          top: { anchor: 'text', align: VerticalAlign.Top },
                          left: { anchor: 'text', align: HorizontalAlign.End },
                        } )
                        .margin( { left: 4 } )
                        .fontWeight( 600 )
                        .fontColor( Color.White )
                        .borderRadius( 7 )
                        .height( 14 )

                      Image( $r( 'app.media.Mine_Report' ) )
                        .height( '100%' )
                        .alignRules( {
                          right: { anchor: '__container__', align: HorizontalAlign.End },
                          top: { anchor: '__container__', align: VerticalAlign.Top },
                          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
                        } )
                    }
                    .height( 80 )
                    .backgroundColor( 0x165DFF )
                    .borderRadius( 18 )
                    .clip( true )
                    .onClick( () => {
                      this.handleClickMenu( item )
                    } )
                  }
                } else if (item == DDMenuType.VIP) {
                  MenuRowItem( {
                    icon: $r( 'app.media.Mine_VIP' ),
                    title: '叮当会员',
                    detail: '距离到期还有' + this.userInfo.remain + '天',
                    isFunction: false,
                    blockDidClickButton: () => {
                      this.handleClickMenu( item )
                    }
                  } )
                } else if (item == DDMenuType.Mobile) {
                  MenuRowItem( {
                    icon: $r( 'app.media.Mine_Mobile' ),
                    title: '手机',
                    detail: '+86 ' + this.userInfo.mobile,
                    isFunction: false,
                    blockDidClickButton: () => {
                      this.handleClickMenu( item )
                    }
                  } )
                } else if (item == DDMenuType.Name) {
                  MenuRowItem( {
                    icon: $r( 'app.media.Mine_Nickname' ),
                    title: '名称',
                    detail: this.userInfo.name.length != 0 ? this.userInfo.name : '家长用户',
                    isFunction: false,
                    blockDidClickButton: () => {
                      this.handleClickMenu( item )
                    }
                  } )
                } else if (item == DDMenuType.About) {
                  MenuRowItem( {
                    icon: $r( 'app.media.Mine_About' ),
                    title: '关于我们',
                    detail: '',
                    isFunction: false,
                    blockDidClickButton: () => {
                      this.handleClickMenu( item )
                    }
                  } )
                } else if (item == DDMenuType.Privacy) {
                  MenuRowItem( {
                    icon: $r( 'app.media.Mine_Privacy' ),
                    title: '隐私政策',
                    detail: '',
                    isFunction: false,
                    blockDidClickButton: () => {
                      this.handleClickMenu( item )
                    }
                  } )
                } else if (item == DDMenuType.Service) {
                  MenuRowItem( {
                    icon: $r( 'app.media.Mine_Service' ),
                    title: '联系客服',
                    detail: '',
                    isFunction: false,
                    blockDidClickButton: () => {
                      this.handleClickMenu( item )
                    }
                  } )
                } else if (item == DDMenuType.Cancellation) {
                  MenuRowItem( {
                    icon: $r( 'app.media.Mine_Cancellation' ),
                    title: '注销账号',
                    detail: '',
                    isFunction: true,
                    blockDidClickButton: () => {
                      this.handleClickMenu( item )
                    }
                  } )
                } else if (item == DDMenuType.Logout) {
                  MenuRowItem( {
                    icon: $r( 'app.media.Mine_Logout' ),
                    title: '退出登录',
                    detail: '',
                    isFunction: true,
                    blockDidClickButton: () => {
                      this.handleClickMenu( item )
                    }
                  } )
                }
              }
            } )
          }
          .margin( { left: 12, right: 12 } )
          .backgroundColor( Color.White )
          .borderRadius( 16 )
        } )
      }
      .scrollBar( BarState.Off )
      .height( '100%' )
      .width( '100%' )
      .backgroundColor( 0xf2f3f5 )
      .edgeEffect( EdgeEffect.Spring )
    }
    .title( '设置与帐号' )
    .titleMode( NavigationTitleMode.Mini )
    .hideBackButton( true )
    .backgroundColor( 0xf2f3f5 )
  }

  handleClickMenu(menu: DDMenuType) {
    console.debug( menu.toString( ) )
    switch (menu) {
      case DDMenuType.Report:
        break
      case DDMenuType.VIP: {
        let option: router.RouterOptions = {
          params: { "": "" },
          url: router_VIPPurchaseViewController
        }
        router.pushUrl( option )
      }
        break
      case DDMenuType.Mobile:
        break
      case DDMenuType.Name:
        break
      case DDMenuType.About:
        break
      case DDMenuType.Privacy:
        break
      case DDMenuType.Service: {
        let option: router.RouterOptions = {
          url: router_ServiceViewController
        }
        router.pushUrl( option )
      }
        break
      case DDMenuType.Cancellation:
        break
      case DDMenuType.Logout:
        XTDataManager.sharedInstance.deleteLoginInfo( )
        let option: router.RouterOptions = {
          url: router_LoginViewController
        }
        router.replaceUrl( option )
        break

    }
  }
}

@Component
struct MenuRowItem {
  @State icon: Resource = $r( 'app.media.Login_Logo' )
  @State title: string = '我的报告'
  @Prop detail: string = '123'
  @Prop isFunction: boolean = false
  blockDidClickButton: () => void = () => {
  };

  constructor(icon: Resource, title: string, detail: string, isFunction: boolean, handleClickItem: () => void) {
    super( )
    this.icon = icon
    this.title = title
    this.detail = detail
    this.isFunction = isFunction
    this.blockDidClickButton = handleClickItem
    this.build( )
  }

  build() {
    RelativeContainer() {
      if (this.isFunction == false) {
        Image( this.icon )
          .id( 'icon' )
          .width( 18 )
          .aspectRatio( 1 )
          .margin( { left: 16 } )
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center }
          } )
        Text( this.title )
          .fontSize( 16 )
          .fontColor( 0x1D2129 )
          .margin( { left: 12 } )
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center },
            left: { anchor: 'icon', align: HorizontalAlign.End }
          } )
        Text( this.detail )
          .fontSize( 14 )
          .fontColor( 0x86909C )
          .margin( { right: 12 } )
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center },
            right: { anchor: 'question', align: HorizontalAlign.Start },
          } )
        Image( $r( 'app.media.Train_Direction_Right' ) )
          .id( 'question' )
          .width( 16 )
          .aspectRatio( 1 )
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center },
            right: { anchor: '__container__', align: HorizontalAlign.End },
          } )
          .margin( { right: 16 } )
      } else {
        Image( this.icon )
          .id( 'icon1' )
          .width( 18 )
          .aspectRatio( 1 )
          .margin( { left: 16 } )
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center }
          } )
        Text( this.title )
          .fontSize( 16 )
          .fontColor( 0xF53F3F )
          .margin( { left: 12 } )
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center },
            left: { anchor: 'icon1', align: HorizontalAlign.End }
          } )
        Image( $r( 'app.media.Train_Direction_Right' ) )

          .id( 'question' )
          .width( 16 )
          .aspectRatio( 1 )
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center },
            right: { anchor: '__container__', align: HorizontalAlign.End },
          } )
          .margin( { right: 16 } )
      }
    }
    .height( 53 )
    .width( '100%' )
    .onClick( this.blockDidClickButton )
  }
}