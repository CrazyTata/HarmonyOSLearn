import { APIs } from "../../../Tool/NetWork/APIs"
import { JhProgressHUD } from "../../../Tool/NetWork/JhProgressHud"
import { router } from '@kit.ArkUI'
import { ApiResult, DDLoginInfoModel } from '../../../Model/DDLoginInfoModel'
import { Net, NetError } from '@abner/net'
import { router_SMSViewController } from '../../../Tool/RouterFile'

@Entry
@Component
struct LoginViewController {
  @State phone: string = ''

  build() {
    Column() {
      Image( $r( 'app.media.Login_Logo' ) )
        .width( 80 )
        .height( 80 )
        .margin( { top: 72 } )

      Text( '叮当家长' )
        .fontSize( 12 )
        .fontColor( 0x86909C )
        .fontWeight( 400 )
        .margin( { top: 8 } )

      TextInput( { placeholder: '请输入手机号' } )
        .id( 'TextInput' )
        .fontSize( 16 )
        .placeholderColor( 0x86909C )
        .margin( { top: 40 } )
        .width( '78%' )
        .height( 48 )
        .textAlign( TextAlign.Center )
        .backgroundColor( Color.Transparent )
        .cancelButton( { style: CancelButtonStyle.INPUT, icon: { size: 16 } } )
        .onChange( (value: string) => {
          this.phone = value
          console.log( 'onChange: ' + value )
        } )

      Divider( )
        .backgroundColor( 0xE5E6EB )
        .width( '78%' )
        .height( 1 )

      Button( '发送验证码' )
        .margin( { top: 24 } )
        .width( '78%' )
        .backgroundColor( 0x165DFF )
        .onClick( () => {
          this.handleClickSend( )
        } )

      Row( { space: 4 } ) {
        Image( $r( 'app.media.Login_Question' ) )
          .width( 12 )
          .height( 12 )
        Text( '数据仅用于测评' )
          .fontColor( '#C9CDD4' )
          .fontSize( 12 )
      }
      .margin( { top: 24 } )

    }
    .alignItems( HorizontalAlign.Center )
    .width( '100%' )
    .height( '100%' )
  }

  handleClickSend() {
    if (this.phone.length < 11) {
      JhProgressHUD.showError( '请输入正确的手机号' )
      return
    }

    Net.post( APIs.login_send_sms )
      .setParams( { mobile: this.phone } )
      .requestObject<ApiResult<DDLoginInfoModel>>( (data) => {
        if (data.code == 200) {
          let option: router.RouterOptions = {
            params: { "mobile": this.phone },
            url: router_SMSViewController
          }
          router.pushUrl( option )
        } else {
          JhProgressHUD.showError( data.message as string )
        }
      }, (error: NetError) => {
        JhProgressHUD.showError( error.getMessage( ) )
      } )
  }
}