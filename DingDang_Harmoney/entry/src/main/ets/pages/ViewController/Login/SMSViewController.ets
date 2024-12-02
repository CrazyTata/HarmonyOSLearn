import { JhProgressHUD } from '../../../Tool/NetWork/JhProgressHud'
import { router } from '@kit.ArkUI';
import { ApiResult, DDLoginInfoModel } from '../../../Model/DDLoginInfoModel';
import { Net } from '@abner/net/src/main/ets/utils/Net';
import { APIs } from '../../../Tool/NetWork/APIs';
import { XTDataManager } from '../../../Tool/XTDataManager';
import { router_Home } from '../../../Tool/RouterFile';

@Entry
@Component
struct SMSViewController {
  @State curTime: number = 5
  @State message: string = this.curTime + '秒后可重新获取'
  @State time: number | null = null
  phone: string = ''

  aboutToAppear(): void {
    if (router.getParams( ) !== undefined && router.getParams( ) !== null) {
      let record = router.getParams( ) as Record<string, string>
      if (record !== undefined) {
        this.phone = record['mobile']
      }
    }
    this.curTime = 60
    this.updateTime( );
    this.startTiming( )
  }

  aboutToDisappear(): void {
    // 清除定时器
    clearInterval( this.time )
  }

  build() {
    Column() {
      Text( '输入验证码' )// .id( 'SMSViewControllerHelloWorld' )
        .fontSize( 24 )
        .fontWeight( 600 )
        .margin( { top: 20 } )

      TextInput( { placeholder: '请输入验证码' } )
        .fontSize( 24 )
        .fontWeight( 600 )
        .fontColor( Color.Black )
        .margin( { top: 40, left: 40, right: 40 } )
        .textAlign( TextAlign.Center )
        .maxLength( 6 )
        .onChange( (value: string) => {
          if (value.length == 6) {
            this.loginWithCode( value )
          }
        } )

      if (this.curTime == 0) {
        Button( this.message )
          .enabled( this.curTime == 0 )
          .margin( { top: 32 } )
          .onClick( () => {
            this.curTime = 60
            this.startTiming( )
          } )
      } else {
        Button( this.message )
          .enabled( this.curTime == 0 )
          .backgroundColor( 0x94BFFF )
          .margin( { top: 32 } )
          .onClick( () => {
            this.curTime = 60
            this.startTiming( )
          } )
      }

    }
    .width( '100%' )
    .alignItems( HorizontalAlign.Center )

  }

  loginWithCode(code: String) {

    let random = Math.floor( Math.random( ) * 100000000000000000 ).toString( )

    Net.post( APIs.login_by_code )
      .setParams( {
        "mobile": this.phone,
        "code": code,
        "is_login_free": 1,
        "user": random
      } )
      .requestObject<ApiResult<DDLoginInfoModel>>( (data) => {
        if (data.code == 200) {
          if (data.data != null) {
            XTDataManager.sharedInstance.saveLoginInfo( data.data )
            let option: router.RouterOptions = {
              url: router_Home
            }
            router.replaceUrl( option )
            JhProgressHUD.showSuccess( '登陆成功' )
          }
        } else {
          JhProgressHUD.showError( data.message as string )
        }
      } )
  }

  updateTime() {
    this.curTime = this.curTime - 1
    if (this.curTime <= 0) {
      this.curTime = 0
      clearInterval( this.time )
    }
    if (this.curTime == 0) {
      this.message = '重新获取'
    } else {
      this.message = this.curTime + '秒后可重新获取'
    }
  }

  startTiming() {
    // 每秒更新一次时间
    this.time = setInterval( () => {
      this.updateTime( )
    }, 1000 );
  }
}