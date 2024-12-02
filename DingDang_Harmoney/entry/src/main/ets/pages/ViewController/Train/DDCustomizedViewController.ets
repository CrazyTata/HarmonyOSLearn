import { DialogUtil, PermissionUtil, PhotoHelper, PickerUtil } from '@pura/harmony-utils'
import { JhProgressHUD } from '../../../Tool/NetWork/JhProgressHud';
import { Font } from '@ohos.arkui.UIContext';
import { PhotoSource } from '@ohos.file.RecentPhotoComponent';
import { photoAccessHelper } from '@kit.MediaLibraryKit';

enum OptionType {
  Time = 1,
  Scene,
  Toy,
  Area
}

@Entry
@Component
struct DDCustomizedViewController {
  scroller: Scroller = new Scroller()
  @State time: string = '任意'
  @State scene: string = '任意'
  @State toy: string = '任意'
  @State area: string = '任意'
  @State currentImage: PixelMap | null = null
  controller: CustomDialogController = new CustomDialogController( {
    builder: CustomizedDialog( {
      value: this.time,
      options: [
        ["起床时间", $r( 'app.media.Customized_Time_Wake_Dark' ), $r( 'app.media.Customized_Time_Wake' )],
        ["吃饭时间", $r( 'app.media.Customized_Time_Eat_Dark' ), $r( 'app.media.Customized_Time_Eat' )],
        ["洗漱时间", $r( 'app.media.Customized_Time_Wash_Dark' ), $r( 'app.media.Customized_Time_Wash' )],
        ["阅读时间", $r( 'app.media.Customized_Time_Read_Dark' ), $r( 'app.media.Customized_Time_Read' )],
        ["玩耍时间", $r( 'app.media.Customized_Time_Play_Dark' ), $r( 'app.media.Customized_Time_Play' )],
        ["睡前时间", $r( 'app.media.Customized_Time_Sleep_Dark' ), $r( 'app.media.Customized_Time_Sleep' )],
      ]
    } ),
    alignment: DialogAlignment.Bottom
  } )
  controller2: CustomDialogController = new CustomDialogController( {
    builder: CustomizedDialog( {
      value: this.scene,
      options: [
        ["客厅", $r( 'app.media.Customized_Place_LivingRoom_Dark' ), $r( 'app.media.Customized_Place_LivingRoom' )],
        ["卧室", $r( 'app.media.Customized_Time_Sleep_Dark' ), $r( 'app.media.Customized_Time_Sleep' )],
        ["卫生间", $r( 'app.media.Customized_Time_Wash_Dark' ), $r( 'app.media.Customized_Time_Wash' )],
        ["厨房", $r( 'app.media.Customized_Place_Kitchen_Dark' ), $r( 'app.media.Customized_Place_Kitchen' )],
        ["商场/超市", $r( 'app.media.Customized_Place_Mall_Dark' ), $r( 'app.media.Customized_Place_Mall' )],
        ["公园", $r( 'app.media.Customized_Place_Park_Dark' ), $r( 'app.media.Customized_Place_Park' )]
      ]
    } ),
    alignment: DialogAlignment.Bottom
  } )
  controller3: CustomDialogController = new CustomDialogController( {
    builder: CustomizedDialog( {
      value: this.toy,
      options: [
        ["玩偶", $r( 'app.media.Customized_Toy_Bear_Dark' ), $r( 'app.media.Customized_Toy_Bear' )],
        ["小汽车", $r( 'app.media.Customized_Toy_Car_Dark' ), $r( 'app.media.Customized_Toy_Car' )],
        ["零食", $r( 'app.media.Customized_Toy_Food_Dark' ), $r( 'app.media.Customized_Toy_Food' )],
        ["积木", $r( 'app.media.Customized_Toy_Lego_Dark' ), $r( 'app.media.Customized_Toy_Lego' )]
      ]
    } ),
    alignment: DialogAlignment.Bottom
  } )
  controller4: CustomDialogController = new CustomDialogController( {
    builder: CustomizedDialog( {
      value: this.area,
      options: [
        ["词汇表达"],
        ["简单互动"],
        ["理解概念"],
        ["词汇理解"],
        ["情绪理解"],
        ["情绪表达"]
      ]
    } ),
    alignment: DialogAlignment.Bottom
  } )

  build() {
    Navigation() {
      Scroll( this.scroller ) {
        Column() {
          Text() {
            Span( '小叮当将根据\n' )
              .fontSize( 18 )
              .fontColor( 0x86909C )
              .fontWeight( 600 )

            Span( '您的选择' )
              .fontSize( 18 )
              .fontColor( 0x1D2129 )
              .fontWeight( 600 )

            Span( '和' )
              .fontSize( 18 )
              .fontColor( 0x86909C )
              .fontWeight( 600 )

            Span( '孩子情况\n' )
              .fontSize( 18 )
              .fontColor( 0x1D2129 )
              .fontWeight( 600 )

            Span( '定制任意练习' )
              .fontSize( 18 )
              .fontColor( 0x86909C )
              .fontWeight( 600 )

          }
          .textAlign( TextAlign.Center )
          .fontSize( 50 )
          .fontWeight( FontWeight.Bold )

          Image( $r( 'app.media.Customized_Robot' ) )
            .margin( { top: 24 } )
            .borderRadius( 20 )

          Text( '请完成以下自定义选项' )
            .margin( { top: 24 } )
            .fontSize( 12 )
            .fontColor( 0xC9CDD4 )
            .fontWeight( 600 )

          Row( { space: 6 } ) {
            CustomizedOptionItem( { title: '时间', result: this.time } )
              .layoutWeight( 0.5 )
              .onClick( () => {
                this.handleClickType( OptionType.Time )
              } )
            CustomizedOptionItem( { title: '场景', result: this.scene } )
              .layoutWeight( 0.5 )
              .onClick( () => {
                this.handleClickType( OptionType.Scene )
              } )
          }
          .margin( { top: 24 } )
          .width( '100%' )

          Row( { space: 6 } ) {
            CustomizedOptionItem( { title: '玩具/材料', result: this.toy } )
              .layoutWeight( 0.5 )
              .onClick( () => {
                this.handleClickType( OptionType.Toy )
              } )
            CustomizedOptionItem( { title: '领域', result: this.area } )
              .layoutWeight( 0.5 )
              .onClick( () => {
                this.handleClickType( OptionType.Area )
              } )
          }
          .margin( { top: 6 } )
          .width( '100%' )

          PhotoPreviewView( { currentImage: this.currentImage } )
            .margin( { top: 6 } )

          GenerateButton( {
            blockDidClick: () => {
              this.handleClickGenerate( )
            }
          } )
            .margin( { top: 24 } )
        }
        .alignItems( HorizontalAlign.Center )
        .width( '100%' )
      }
      .margin( { left: 20, right: 20 } )
      .scrollBar( BarState.Off )
    }
    .backButtonIcon( $r( 'app.media.Navbar_arrow_left' ) )
    .titleMode( NavigationTitleMode.Mini )
    .title( '' )
  }

  handleClickType(type: OptionType) {
    switch (type) {
      case OptionType.Time:
        this.controller.open( )
        break
      case OptionType.Scene:
        this.controller2.open( )
        break
      case OptionType.Toy:
        this.controller3.open( )
        break
      case OptionType.Area:
        this.controller4.open( )
        break
    }
  }

  handleClickGenerate() {
    console.debug( 'handleClickGenerate' )
    if (this.time != undefined) {
      console.debug( 'CustomizedDialog', 'value: ' + this.time )
    }
    if (this.scene != undefined) {
      console.debug( 'CustomizedDialog', 'value: ' + this.scene )
    }
    if (this.toy != undefined) {
      console.debug( 'CustomizedDialog', 'value: ' + this.toy )
    }
    if (this.area != undefined) {
      console.debug( 'CustomizedDialog', 'value: ' + this.area )
    }
  }
}

@Component
struct CustomizedOptionItem {
  @Prop title: string
  @Prop result: string

  build() {
    Column() {
      Text( this.title )
        .margin( { top: 10 } )
        .fontSize( 14 )
        .fontWeight( 500 )
        .fontColor( 0x86909C )

      RelativeContainer() {
        Row( { space: 2 } ) {
          Text( this.result )
            .fontSize( 16 )
            .fontWeight( 600 )
            .fontColor( 0x1D2129 )
          Image( $r( 'app.media.Customized_Arrow_Down' ) )
            .width( 16 )
        }
        .alignRules( {
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        } )
      }
      .height( 46 )
      .borderRadius( 14 )
      .backgroundColor( Color.White )
      .margin( {
        left: 8,
        bottom: 8,
        right: 8,
        top: 8
      } )
    }
    .backgroundColor( 0xF2F3F5 )
    .borderRadius( 20 )
    .height( 92 )
  }
}

@Component
struct PhotoPreviewView {
  @Link currentImage: PixelMap | null

  build() {
    Column() {
      Text( '添加照片' )
        .margin( {
          top: 14
        } )
      Image( this.currentImage == null ? $r( 'app.media.Customized_Picture_Placeholder' ) : this.currentImage )
        .margin( {
          left: 12,
          right: 12,
          top: 12
        } )
        .borderRadius( 14 )
        .onClick( () => {
          if (this.currentImage == null) {
            this.handleClickSelectImage( )
          }
        } )

      Text( '拍摄或上传一张照片，提供当前孩子或场景、道具信息，帮助小叮当更好地生成练习。' )
        .margin( {
          top: 12,
          left: 20,
          right: 20,
          bottom: 20
        } )
        .fontSize( 14 )
        .fontWeight( 400 )
        .fontColor( 0x86909C )
    }
    .width( '100%' )
    .borderRadius( 16 )
    .backgroundColor( 0xF2F3F5 )
  }

  async handleClickSelectImage() {
    let isGrant = PermissionUtil.checkPermissions( 'ohos.permission.READ_IMAGEVIDEO' )
    if (!isGrant) {
      console.debug( 'isGrant', isGrant )
      let result = await PermissionUtil.requestPermissions( 'ohos.permission.READ_IMAGEVIDEO' )
      if (result == false) {
        return
      }
    }
    PickerUtil.selectPhoto( ).then( async uris => {
      let photoAsset = await PhotoHelper.getPhotoAsset( uris[0] );
      try {
        let name = photoAsset?.get( photoAccessHelper.PhotoKeys.DISPLAY_NAME );
        let type = photoAsset?.get( photoAccessHelper.PhotoKeys.PHOTO_TYPE );
        let title = photoAsset?.get( photoAccessHelper.PhotoKeys.TITLE.toString( ) );
        let size = photoAsset?.get( photoAccessHelper.PhotoKeys.SIZE.toString( ) );
        let with1 = photoAsset?.get( photoAccessHelper.PhotoKeys.WIDTH.toString( ) );
        let height = photoAsset?.get( photoAccessHelper.PhotoKeys.HEIGHT.toString( ) );
        let date = photoAsset?.get( photoAccessHelper.PhotoKeys.DATE_TAKEN.toString( ) );
        let orientation = photoAsset?.get( photoAccessHelper.PhotoKeys.ORIENTATION.toString( ) );
        // this.uriStr = `图片信息：\n文件名：${name}\n文件类型：${type}\n文件大小：${size}\n图片宽度：${with1}\n图片高度：${height}\n拍摄日期：${date}\n文件标题：${title}\n图片文件的方向：${orientation}`
      } catch (err) {
        console.debug( "读取图片信息失败：" + JSON.stringify( err ) );
      }
      photoAsset?.getThumbnail( (err, pixelMap,) => {
        if (err) {
          console.debug( "缩略图-异常：" + JSON.stringify( err ) )
        }
        this.currentImage = pixelMap;
      } )
    } )
  }
}

@Component
struct GenerateButton {
  blockDidClick: () => void = () => {
  };

  build() {
    Button( { type: ButtonType.Normal } ) {
      Row() {
        Image( $r( 'app.media.VIP_Star_Pure' ) )
          .width( 16 )
        Text( '生成练习' )
          .fontSize( 16 )
          .fontWeight( 500 )
          .fontColor( Color.White )
      }
    }
    .onClick( this.blockDidClick )
    .width( '100%' )
    .height( 48 )
    .fontSize( 16 )
    .fontColor( Color.White )
    .backgroundColor( 0x165DFF )
    .borderRadius( 14 )
  }
}

@CustomDialog
struct CustomizedDialog {
  dialogController?: CustomDialogController
  @Prop options: [string, Resource?, Resource?][] = []
  @Link value: string
  @State isEditing: boolean = false
  @State editValue: string = ''
  blockDidConfirm: (value: string) => void = () => {
  };

  build() {
    Column() {
      Button( )
        .height( 5 )
        .width( 40 )
        .borderRadius( 2.5 )
        .backgroundColor( 0xC9CDD4 )
        .margin( { top: 8 } )
      Button( { type: ButtonType.Normal } ) {
        Text( '任意' )
          .fontColor( 0x86909C )
          .fontSize( 16 )
          .fontWeight( 600 )
          .width( '100%' )
          .textAlign( TextAlign.Center )
      }
      .onClick( () => {
        this.value = '任意'
        this.blockDidConfirm( this.value )
        if (this.dialogController != undefined) {
          this.dialogController.close( )
        }
      } )
      .margin( { top: 20, left: 20, right: 20 } )
      .borderRadius( 12 )
      .backgroundColor( 0xF2F3F5 )
      .height( 54 )

      Grid() {
        ForEach( this.options, (item: [string, Resource, Resource]) => {
          GridItem() {
            Button( { type: ButtonType.Normal } ) {
              RelativeContainer() {
                Row() {
                  if (item[1] !== undefined) {
                    Image( this.value == item[0] ? item[1] : item[2] )
                      .width( 20 )
                  }
                  Text( item[0] )
                    .fontSize( 16 )
                    .fontWeight( 600 )
                    .fontColor( this.value == item[0] ? 0x1D2129 : 0x86909C )
                }
                .alignRules( {
                  center: { anchor: '__container__', align: VerticalAlign.Center },
                  middle: { anchor: '__container__', align: HorizontalAlign.Center }
                } )
              }
            }
            .onClick( () => {
              this.value = item[0]
              this.blockDidConfirm( this.value )
              if (this.dialogController != undefined) {
                this.dialogController.close( )
              }
            } )
            .height( 54 )
            .backgroundColor( this.value == item[0] ? 0xFADC19 : 0xf2f3f5 )
            .borderRadius( 12 )
          }
        }
        )
      }
      .columnsTemplate( '1fr 1fr' )
      .columnsGap( 8 )
      .rowsGap( 8 )
      .margin( { left: 20, right: 20, top: 8 } )
      .height( 54 * this.rowCount( ) + 8 * (this.rowCount( )) )

      if (this.isEditing == false) {
        Button( { type: ButtonType.Normal } ) {
          Row( { space: 8 } ) {
            Image( this.isCustomizedValue( ) ? $r( 'app.media.Customized_Any_Else_Dark' ) :
            $r( 'app.media.Customized_Any_Else' ) )
              .width( 20 )
            Text( this.isCustomizedValue( ) ? this.value : '自定义' )
              .fontColor( this.isCustomizedValue( ) ? 0x1D2129 : 0x86909C )
              .fontSize( 16 )
              .fontWeight( 600 )
              .textAlign( TextAlign.Center )
          }
          .justifyContent( FlexAlign.Center )
          .width( '100%' )
        }
        .onClick( () => {
          this.isEditing = !this.isEditing
        } )
        .margin( {
          left: 20,
          right: 20,
          bottom: 40
        } )
        .borderRadius( 12 )
        .backgroundColor( this.isCustomizedValue( ) ? 0xFADC19 : 0xf2f3f5 )
        .height( 54 )
      } else {
        RelativeContainer() {
          TextInput( { placeholder: '请输入自定义内容', text: this.editValue } )
            .placeholderColor( 0x86909C )
            .fontSize( 16 )
            .fontWeight( 600 )
            .fontColor( 0x1D2129 )
            .height( '100%' )
            .width( '100%' )
            .backgroundColor( 0xF2F3F5 )
            .onChange( (value: string) => {
              if (value.length == 0) {
                return
              }
              this.editValue = value
            } )

          Button( { type: ButtonType.Normal } ) {
            Text( '确认' )
              .margin( {
                left: 12,
                right: 12,
                top: 8,
                bottom: 8
              } )
              .fontSize( 15 )
              .fontWeight( 500 )
              .fontColor( Color.White )
          }
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          } )
          .margin( { right: 8 } )
          .backgroundColor( 0x165DFF )
          .borderRadius( 8 )
          .onClick( () => {
            this.value = this.editValue
            this.blockDidConfirm( this.value )
            if (this.dialogController != undefined) {
              this.dialogController.close( )
            }
          } )
        }
        .height( 54 )
        .borderRadius( 12 )
        .backgroundColor( 0xF2F3F5 )
        .margin( {
          left: 20,
          right: 20,
          bottom: 40
        } )
      }

    }
    .backgroundColor( Color.White )
    .width( '100%' )
  }

  rowCount() {
    return this.options.length % 2 == 0 ? this.options.length / 2 : this.options.length / 2 + 1
  }

  isCustomizedValue() {
    let isCustomizedValue: boolean = true
    if (this.value == '任意') {
      return false
    }
    this.options.forEach( (item: [string, Resource?, Resource?]) => {
      if (item[0] == this.value) {
        isCustomizedValue = false
      }
    } )
    return isCustomizedValue
  }
}