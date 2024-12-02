import { pasteboard } from '@kit.BasicServicesKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import { PermissionUtil } from '@pura/harmony-utils';
import { JhProgressHUD } from '../../../Tool/NetWork/JhProgressHud';

@Entry
@Component
struct ServiceViewController {
  @State message: string = 'Hello World';

  build() {
    Navigation() {
      Column( { space: 20 } ) {
        Column( { space: 12 } ) {
          Text( '通过微信号添加叮当客服为好友' )
            .margin( { top: 20 } )
          Button( { type: ButtonType.Normal } ) {
            Row( { space: 8 } ) {
              Text( 'rachelsuperstar' )
              Image( $r( 'app.media.Share_Copy' ) )
                .width( 18 )
                .aspectRatio( 1 )
            }
            .padding( { left: 16, right: 16 } )
          }
          .onClick( this.handleClickCopy )
          .height( 46 )
          .backgroundColor( 0xF2F3F5 )
          .borderRadius( 8 )
          .margin( { bottom: 20 } )
        }
        .borderWidth( 1 )
        .borderColor( 0xf2f3f5 )
        .width( '90%' )
        .borderRadius( 12 )

        Column( { space: 12 } ) {
          Text( '通过微信二维码添加叮当客服为好友' )
            .margin( { top: 20 } )
          Button( { type: ButtonType.Normal } ) {
            Column( { space: 8 } ) {
              Image( $r( 'app.media.QRCode_Helper' ) )
                .width( 80 )
                .aspectRatio( 1 )
                .margin( { top: 12 } )
              Text( '点击保存二维码' )
                .fontSize( 14 )
                .fontColor( '#165DFF' )
                .fontWeight( 600 )
                .margin( { bottom: 12 } )
            }
          }
          .onClick( () => {
            this.handleClickSave( )
          } )
          .margin( { bottom: 20 } )
          .backgroundColor( 0xF2F3F5 )
          .borderRadius( 8 )
          .padding( { left: 16, right: 16 } )
        }
        .borderWidth( 1 )
        .borderColor( 0xf2f3f5 )
        .width( '90%' )
        .borderRadius( 12 )

      }
      .height( '100%' )
      .width( '100%' )
    }
    .title( '联系客服' )
    .backButtonIcon( $r( 'app.media.Navbar_arrow_left' ) )
    .titleMode( NavigationTitleMode.Mini )
  }

  handleClickCopy() {
    const shardedUrl = "rachelsuperstar"
    const pasteboardData = pasteboard.createData( pasteboard.MIMETYPE_TEXT_PLAIN, shardedUrl )
    const systemPasteboard = pasteboard.getSystemPasteboard( )
    systemPasteboard.setData( pasteboardData )
  }

  async handleClickSave() {

    try {
      let context: Context = getContext( this );

      const resourceMgr: resourceManager.ResourceManager = context.resourceManager;

      let helper = photoAccessHelper.getPhotoAccessHelper( context );
      let uri = await helper.createAsset( photoAccessHelper.PhotoType.IMAGE, 'jpeg' );
      let file = await fs.open( uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE );
      const fileData: Uint8Array = await resourceMgr.getMediaContent( $r( 'app.media.QRCode_Helper' ) )
      const buffer = fileData.buffer;

      // 写入文件并关闭文件流
      await fs.write( file.fd, buffer );
      await fs.close( file.fd );

      JhProgressHUD.showSuccess( '保存成功' )
    } catch (e) {
      JhProgressHUD.showError( '保存失败' )
    }


  }

  async onPageShow(): Promise<void> {
    let result = await PermissionUtil.checkPermissions( 'ohos.permission.WRITE_IMAGEVIDEO' )
    if (result == false) {
      console.debug( 'onPageShow false' )
      PermissionUtil.requestPermissions( ['ohos.permission.WRITE_IMAGEVIDEO'] )
    } else {
      console.debug( 'onPageShow true' )
    }
  }
}