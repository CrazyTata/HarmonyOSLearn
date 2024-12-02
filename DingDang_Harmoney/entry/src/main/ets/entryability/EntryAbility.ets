import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { JhProgressHUD } from '../Tool/NetWork/JhProgressHud';
import { AppUtil, PreferencesUtil } from '@pura/harmony-utils';
import { Net } from '@abner/net'
import { XTDataManager } from '../Tool/XTDataManager';
import { router_Home, router_LoginViewController } from '../Tool/RouterFile';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    AppUtil.init( this.context );
    PreferencesUtil.init( 'DingDang' )
    hilog.info( 0x0000, 'testTag', '%{public}s', 'Ability onCreate' );
  }

  onDestroy(): void {
    hilog.info( 0x0000, 'testTag', '%{public}s', 'Ability onDestroy' );
  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability
    hilog.info( 0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate' );

    AppUtil.init( this.context );
    PreferencesUtil.init( 'DingDang' )

    let defaultKey = router_LoginViewController
    let info = XTDataManager.sharedInstance.getLoginInfo( )
    if (info.token.length != 0) {
      defaultKey = router_Home
    }
    console.debug( 'defaultKey', defaultKey )
    windowStage.loadContent( defaultKey, (err) => {
      if (err.code) {
        hilog.error( 0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify( err ) ?? '' );
        return;
      }
      hilog.info( 0x0000, 'testTag', 'Succeeded in loading the content.' );
      JhProgressHUD.initConfig( windowStage )
      Net.getInstance( ).init( {
        baseUrl: "https://dingapitest.whitexiaomao.com", //设置全局baseurl
        connectTimeout: 10000, //设置连接超时
        readTimeout: 10000, //设置读取超时
        // netErrorInterceptor: new MyNetErrorInterceptor(), //设置全局错误拦截,需要自行创建,可在这里进行错误处理
        header: {}, //头参数
        resultTag: [], //接口返回数据data层参数，比如data,items等等
        plugin: []//插件，类似于拦截器
      } )
    } );
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info( 0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy' );
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info( 0x0000, 'testTag', '%{public}s', 'Ability onForeground' );
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info( 0x0000, 'testTag', '%{public}s', 'Ability onBackground' );
  }
}
