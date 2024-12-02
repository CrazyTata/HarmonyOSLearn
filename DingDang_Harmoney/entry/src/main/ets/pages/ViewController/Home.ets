import { Net } from '@abner/net';
import { XTDataManager } from '../../Tool/XTDataManager';
import { AccountViewController } from './Account/AccountViewController';
import { HomePage } from './HomePage';
import { JhProgressHUD } from '../../Tool/NetWork/JhProgressHud';
import { DDUserInfoModel } from '../../Model/DDUserInfoModel';
import { ApiResult } from '../../Model/DDLoginInfoModel';
import { APIs } from '../../Tool/NetWork/APIs';
import { DDDocumentListModel } from '../../Model/DDDocumentListModel';
import { DDTrainHomeViewController } from './Train/DDTrainHomeViewController';

@Entry
@Component
struct BottomTabPage2 {
  @State currentIndex: number = 1
  private tabsController: TabsController = new TabsController()
  @State userInfo: DDUserInfoModel = new DDUserInfoModel()
  @State documents: DDDocumentListModel = new DDDocumentListModel()

  @Builder
  TabBuilder(title: string, targetIndex: number, normalImg: Resource, selectedImg: Resource) {
    Column() {
      Image( this.currentIndex == targetIndex ? selectedImg : normalImg )
        .width( 28 )
        .height( 28 )
      Text( title )
        .fontSize( 14 )
        .margin( { top: 4 } )
        .fontColor( this.currentIndex == targetIndex ? '#45C461' : '#999999' )
    }
    .backgroundColor( "#ffffff" )
    .width( '100%' )
    .height( 60 )
    .justifyContent( FlexAlign.Center )
    .onClick( () => {
      this.currentIndex = targetIndex
    } )
  }

  build() {
    Column() {
      Tabs( { controller: this.tabsController, index: this.currentIndex } ) {
        TabContent() {
          HomePage( { documentList: this.documents } )
        }
        .backgroundColor( 0xf2f3f5 )
        .tabBar( this.TabBuilder( '', 0, $r( "app.media.Tabbar_Home_uc" ), $r( "app.media.Tabbar_Home_c" ) ) )
        .onWillShow( () => {
          let token = XTDataManager.sharedInstance.getLoginInfo( ).token as string

          Net.get( APIs.get_user )
            .setHeaders( { Authorization: token } )
            .requestObject<ApiResult<DDUserInfoModel>>( (data) => {
              if (data.code == 200) {
                let infoModel = data.data
                if (infoModel != null) {
                  XTDataManager.sharedInstance.saveUserInfo( infoModel )
                }

                let info = XTDataManager.sharedInstance.getUserInfo( )
                this.userInfo = info
              } else {
                JhProgressHUD.showError( data.message as string )
              }
            } )

          Net.get( APIs.children_get )
            .setHeaders( { Authorization: token } )
            .requestObject<ApiResult<DDDocumentListModel>>( (data) => {
              if (data.code == 200) {
                let infoModel = data.data
                if (infoModel != null) {
                  XTDataManager.sharedInstance.documentList = infoModel
                  this.documents = infoModel
                }
              } else {
                JhProgressHUD.showError( data.message as string )
              }
            } )
        } )

        TabContent() {
          DDTrainHomeViewController( )
        }
        .tabBar( this.TabBuilder( '', 1, $r( "app.media.Tabbar_Train_uc" ), $r( "app.media.Tabbar_Train_c" ) ) )

        TabContent() {
          AccountViewController( { userInfo: this.userInfo } )
        }
        .tabBar( this.TabBuilder( '', 2, $r( "app.media.Tabbar_Settings_uc" ), $r( "app.media.Tabbar_Settings_c" ) ) )
      }
      .barPosition( BarPosition.End )
      .onChange( (index: number) => {
        this.currentIndex = index
      }
      )
    }
  }

  onPageShow() {

    let token = XTDataManager.sharedInstance.getLoginInfo( ).token as string

    // Net.get( APIs.get_user )
    //   .setHeaders( { Authorization: token } )
    //   .requestObject<ApiResult<DDUserInfoModel>>( (data) => {
    //     if (data.code == 200) {
    //       let infoModel = data.data
    //       if (infoModel != null) {
    //         XTDataManager.sharedInstance.saveUserInfo( infoModel )
    //       }
    //
    //       let info = XTDataManager.sharedInstance.getUserInfo( )
    //       this.userInfo = info
    //     } else {
    //       JhProgressHUD.showError( data.message as string )
    //     }
    //   } )

    // Net.get( APIs.children_get )
    //   .setHeaders( { Authorization: token } )
    //   .requestObject<ApiResult<DDDocumentListModel>>( (data) => {
    //     if (data.code == 200) {
    //       let infoModel = data.data
    //       if (infoModel != null) {
    //         XTDataManager.sharedInstance.documentList = infoModel
    //         this.documents = infoModel
    //       }
    //     } else {
    //       JhProgressHUD.showError( data.message as string )
    //     }
    //   } )
  }
}
