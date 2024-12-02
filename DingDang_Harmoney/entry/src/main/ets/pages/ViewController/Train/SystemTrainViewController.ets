import { ApiResult, Net, NetError } from "@abner/net";
import { Font } from "@kit.ArkUI";
import { StringUtil } from "@ohos/httpclient";
import { RandomUtil } from "@pura/harmony-utils";
import { DDDocumentListModel } from "../../../Model/DDDocumentListModel";
import { DDPracticeListModel, DDPracticeModel } from "../../../Model/DDPracticeListModel";
import { APIs } from "../../../Tool/NetWork/APIs";
import { JhProgressHUD } from "../../../Tool/NetWork/JhProgressHud";
import { XTDataManager } from "../../../Tool/XTDataManager";

@Entry
export struct SystemTrainViewController {
  @State message: string = 'Hello World';
  @State keyword: string = ''
  controller: SearchController = new SearchController()
  @State trainType: string = '推荐练习'
  @Prop trainList: Array<DDPracticeModel> = []
  @State page: number = 1

  build() {
    Column() {
      Search( { value: this.keyword, placeholder: '搜索练习' } )
        .searchButton( '搜索', { fontColor: 0x86909C, fontSize: 15 } )
        .margin( { left: 12, right: 12 } )
        .placeholderColor( 0xC9CDD4 )
        .placeholderFont( { size: 15, weight: 400 } )
        .onSubmit( (value: string) => {
          this.keyword = value
          console.debug( 'keyword: ' + value )
        } )

      Text( this.trainType )
        .fontSize( 12 )
        .fontWeight( 600 )
        .fontColor( 0x86909C )
        .margin( { left: 12, top: 12 } )

      List() {
        ForEach( this.trainList, (item: string) => {
          ListItem() {
            RelativeContainer() {
              Image( $r( 'app.media.New_Train_Icon_Placeholder' ) )
                .id( 'Image' )
                .width( 48 )
                .aspectRatio( 1 )
                .margin( { left: 12 } )
                .alignRules( {
                  top: { anchor: '__container__', align: VerticalAlign.Top },
                  bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
                } )
              Text( item )
                .fontSize( 15 )
                .fontWeight( 600 )
                .fontColor( 0x333333 )
                .margin( { left: 12, top: 12 } )
                .alignRules( {
                  left: { anchor: 'Image', align: HorizontalAlign.End },
                  bottom: { anchor: 'Image', align: VerticalAlign.Center },
                  right: { anchor: '__container__', align: HorizontalAlign.End }
                } )
              Text( '2022-03-01' )
                .fontSize( 12 )
                .fontWeight( 400 )
                .fontColor( 0x86909C )
                .margin( { left: 12, top: 4 } )
                .alignRules( {
                  left: { anchor: 'Image', align: HorizontalAlign.End },
                  top: { anchor: 'Image', align: VerticalAlign.Center },
                  right: { anchor: '__container__', align: HorizontalAlign.End }
                } )
            }
            .height( 48 )
            .margin( { top: 20 } )
          }
        } )
      }
      .listDirection( Axis.Vertical )
    }
    .alignItems( HorizontalAlign.Start )
    .backgroundColor( Color.White )
    .width( '100%' )
    .height( '100%' )
  }

  onPageShow(): void {
    console.debug( 'SystemTrainViewController', 'onPageShow' )
  }

  onPageHide(): void {
    console.debug( 'SystemTrainViewController', 'onPageHide' )
  }

  aboutToAppear(): void {
    console.debug( 'SystemTrainViewController', 'aboutToAppear' )
  }

  aboutToDisappear(): void {
    console.debug( 'SystemTrainViewController', 'aboutToDisappear' )
  }
}