import { text } from '@kit.ArkGraphics2D';

@Entry
@Component
struct VIPPurchaseViewController {
  scroller: Scroller = new Scroller()
  @State message: string = 'Hello World';
  @State num: number = 20
  @State productList: [string, number, number][] = [['3个月', 1199, 0], ['6个月', 1899, 2398], ['12个月', 2999, 4796]]
  @State currentPrice: number = 1199

  build() {
    Navigation() {
      Scroll( this.scroller ) {
        Column() {
          VIPRightsView( )
          Text( '更换套餐' )
            .fontSize( 13 )
            .fontWeight( 400 )
            .fontColor( 0x86909C )
            .margin( { top: 40, left: 22 } )

          ForEach( this.productList, (item: [string, number, number]) => {
            VIPProductButton( {
              name: item[0],
              price: item[1],
              originPrice: item[2],
              isSelected: this.currentPrice == item[1]
            } )
              .margin( { top: 8 } )
              .onClick( () => {
                this.currentPrice = item[1]
              } )
          } )

          Text( '自动续订，可随时取消' )
            .margin( { top: 92 } )
            .width( '100%' )
            .textAlign( TextAlign.Center )
            .fontSize( 12 )
            .fontWeight( 400 )
            .fontColor( 0x86909C )

          Button( { type: ButtonType.Normal } ) {
            RelativeContainer() {
              Row() {
                Image( $r( 'app.media.Vip_Unlock_Star' ) )
                  .width( 20 )
                  .aspectRatio( 1 )
                Text( '支付' + `${this.currentPrice}` + '元' )
                  .fontSize( 16 )
                  .fontWeight( 600 )
                  .fontColor( Color.White )
              }
              .alignRules( {
                center: { anchor: '__container__', align: VerticalAlign.Center },
                middle: { anchor: '__container__', align: HorizontalAlign.Center }
              } )
            }
          }
          .backgroundColor( 0x165DFF )
          .borderRadius( 16 )
          .margin( { left: 24, right: 24, top: 12 } )
          .height( 50 )

          Text( '开通前请阅读《会员服务协议》(含自动续费条款)' )
            .fontSize( 11 )
            .fontWeight( 400 )
            .fontColor( 0x86909C )
            .textAlign( TextAlign.Center )
            .width( '100%' )
            .margin( { top: 12 } )

          Text( '自动续费会员说明\n' +
            '1.订阅周期：季卡、半年卡、年卡（自动续费产品）。\n' +
            '2.订阅价格：自动续费产品：季卡价格为1199元，半年卡价格为1899元，年卡价格为2999元。\n' +
            '3.付款：用户确认购买并付款后记入iTunes账户，用户可以通过用户的帐户设置来管理用户的订阅和自动更新。\n' +
            '4.取消续订：如需取消续订，请在当前订阅周期到期前24小时以前，手动在iTunes/AppleID设置管理中关闭自动续订功能。\n' +
            '5.续订会员的自有充值账户或苹果iTunes账户会在到期前24小时内扣费，扣费成功后订阅周期顺延一个订阅周期。\n' +
            '6.隐私政策：https://www.whitexiaomao.com/ding/privacy.txt\n' +
            '7.自动续费会员服务协议：https://www.whitexiaomao.com/ding/membership agreement.txt' )

        }
        .alignItems( HorizontalAlign.Start )
      }
    }
    .titleMode( NavigationTitleMode.Mini )
    .backButtonIcon( $r( 'app.media.Navbar_arrow_left' ) )
    .height( '100%' )
    .width( '100%' )
    .backgroundColor( Color.White )
  }
}

@Component
struct VIPRightsView {
  @State list: string[] =
    ['全领域评估与报告2次', '练习目标体系全解锁', '目标领域练习个性化生成每月200次', '自定义练习生成每月100次',
      '练习库、教具库全解锁']

  build() {
    Column() {
      Row() {
        Text( '叮当会员' )
          .fontSize( 15 )
          .fontWeight( 600 )
          .fontColor( 0x1D2129 )
          .margin( { left: 16 } )
          .layoutWeight( 0.3 )
        Text( '距离到期还有 24 天' )
          .fontSize( 14 )
          .fontWeight( 400 )
          .fontColor( 0x86909C )
          .margin( { right: 16 } )
      }
      .width( '100%' )
      .margin( { left: 16, right: 16, top: 12 } )

      Column( { space: 4 } ) {
        ForEach( this.list, (item: string) => {
          Row( { space: 12 } ) {
            Image( $r( 'app.media.VIP_Right_Check' ) )
              .width( 20 )
              .aspectRatio( 1 )
            Text( item )
              .fontSize( 13 )
              .fontWeight( 500 )
              .fontColor( 0x4E5969 )
          }
        } )
      }
      .padding( 12 )
      .alignItems( HorizontalAlign.Start )
      .width( '90%' )
      .margin( {
        top: 16,
        bottom: 16,
        left: 16,
        right: 16
      } )
      .backgroundColor( 0xF7F8FA )
      .borderRadius( 8 )
    }
    .margin( { left: 12, right: 12 } )
    .backgroundColor( Color.White )
    .borderRadius( 16 )
    .borderColor( 0xf2f3f5 )
    .borderWidth( 1 )
  }
}

@Component
struct VIPProductButton {
  @Prop name: string
  @Prop price: number
  @Prop originPrice: number
  @Prop discount: number
  @Prop isSelected: boolean

  build() {
    RelativeContainer() {
      Text( this.name )
        .alignRules( {
          bottom: { anchor: '__container__', align: VerticalAlign.Center }
        } )
        .margin( { bottom: 1, left: 12 } )
        .fontColor( 0x1D2129 )
        .fontSize( 16 )
        .fontWeight( 600 )

      Text( '¥' + `${this.price}` )
        .id( 'price' )
        .alignRules( {
          top: { anchor: '__container__', align: VerticalAlign.Center }
        } )
        .margin( { top: 1, left: 12 } )
        .fontColor( 0x165DFF )
        .fontSize( 14 )
        .fontWeight( 500 )
      if (this.originPrice > 0) {
        Text( '原价' + `${this.originPrice}` )
          .alignRules( {
            center: { anchor: 'price', align: VerticalAlign.Center },
            left: { anchor: 'price', align: HorizontalAlign.End }
          } )
          .margin( { left: 6 } )
          .fontColor( 0x86909C )
          .fontSize( 14 )
          .fontWeight( 400 )
          .decoration( { type: TextDecorationType.LineThrough, color: 0x86909C } )

        Text( `${Math.floor( this.price / this.originPrice * 100 ) / 10.0}` + '折' )
          .backgroundColor( 0xf2f3f5 )
          .padding( {
            top: 4,
            bottom: 4,
            left: 8,
            right: 8
          } )
          .alignRules( {
            top: { anchor: '__container__', align: VerticalAlign.Top },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          } )
          .borderRadius( { bottomLeft: 8 } )
          .fontColor( 0x165DFF )
          .fontSize( 12 )
          .fontWeight( 600 )
      }
    }
    .margin( { left: 22, right: 22 } )
    .height( 68 )
    .backgroundColor( this.isSelected ? 0xE8F3FF : Color.White )
    .borderRadius( 16 )
    .borderColor( this.isSelected == true ? 0x165DFF : 0xf2f3f5 )
    .borderWidth( 1 )
    .clip( true )
  }
}