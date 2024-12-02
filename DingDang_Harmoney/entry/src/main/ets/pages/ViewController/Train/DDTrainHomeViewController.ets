import { ApiResult, Net, NetError } from "@abner/net";
import { RandomUtil } from "@pura/harmony-utils";
import { DDPracticeListModel, DDPracticeModel } from "../../../Model/DDPracticeListModel";
import { APIs } from "../../../Tool/NetWork/APIs";
import { JhProgressHUD } from "../../../Tool/NetWork/JhProgressHud";
import { XTDataManager } from "../../../Tool/XTDataManager";
import { SystemTrainViewController } from "./SystemTrainViewController";

@Entry
@Component
export struct DDTrainHomeViewController {
  @State message: string = 'Hello World';
  private tabsController: TabsController = new TabsController()
  @State currentIndex: number = 0
  @Prop trainList: Array<DDPracticeModel>
  @State systemPage: number = 1

  build() {
    Tabs( { controller: this.tabsController } ) {
      TabContent() {
        SystemTrainViewController( { trainList: this.trainList } )
      }
      .backgroundColor( 0xf2f3f5 )
      .tabBar( this.TabBuilder( '练习', 0 ) )
      .onWillShow( () => {
        console.debug( 'SystemTrainViewController onWillShow' )
        this.queryPracticeList( )
      } )

      TabContent() {
        Column() {
          Text( '1' )
        }
      }
      .backgroundColor( 0xf2f3f5 )
      .tabBar( this.TabBuilder( '教具', 1 ) )


      TabContent() {
        Column() {
          Text( '2' )
        }
      }
      .backgroundColor( 0xf2f3f5 )
      .tabBar( this.TabBuilder( '我的', 2 ) )
      .onWillShow( () => {
        console.debug( '我的 onWillShow' )
      } )

    }
    .barMode( BarMode.Scrollable )
    .barPosition( BarPosition.Start )
    .onChange( (index: number) => {
      this.currentIndex = index
      this.reloadPageData( )
    } )

  }

  @Builder
  TabBuilder(title: string, targetIndex: number) {
    Column() {
      Text( title )
        .fontSize( 16 )
        .fontWeight( this.currentIndex == targetIndex ? 600 : 400 )
        .fontColor( this.currentIndex == targetIndex ? 0x1D2129 : 0x86909C )
      if (this.currentIndex == targetIndex) {
        Button( )
          .height( 3 )
          .width( 32 )
          .borderRadius( 2 )
          .backgroundColor( 0x165DFF )
      }
    }
    .margin( { left: 12, right: 12 } )
    .backgroundColor( "#ffffff" )
    .onClick( () => {
      this.currentIndex = targetIndex
      this.tabsController.changeIndex( this.currentIndex )
    } )
  }

  onPageShow(): void {
    this.reloadPageData( )
  }

  reloadPageData() {
    console.debug( 'currentIndex: ' + this.currentIndex )
    switch (this.currentIndex) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      default:
        break;
    }
  }

  queryPracticeList() {
    let childrenList = XTDataManager.sharedInstance.documentList.list
    if (childrenList.length == 0) {
      return
    }
    let childrenId = childrenList[0].id
    let uuid = RandomUtil.getRandomStr( 18, 'qwertyuiopasdfghjklzxcvbnm1234567890' )
    let token = XTDataManager.sharedInstance.getLoginInfo( ).token as string

    Net.get( APIs.practice_list )
      .setHeaders( { Authorization: token } )
      .setParams( {
        rand: uuid,
        page: this.systemPage,
        page_size: 10,
        children_id: childrenId
      } )
      .requestObject<ApiResult<DDPracticeListModel>>( (data) => {
        if (data.code == 200) {
          if (data.data != undefined) {
            this.trainList = data.data.list
          }
        } else {
          JhProgressHUD.showError( data.message as string )
        }
      }, (error: NetError) => {
        JhProgressHUD.showError( error.getMessage( ) )
      } )
  }
}