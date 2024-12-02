import { ApiResult, Net } from '@abner/net'
import { DateUtil, DialogUtil, KeyboardUtil } from '@pura/harmony-utils'
import { APIs } from '../../../Tool/NetWork/APIs'
import { DDLoginInfoModel } from '../../../Model/DDLoginInfoModel'
import { JhProgressHUD } from '../../../Tool/NetWork/JhProgressHud'
import { XTDataManager } from '../../../Tool/XTDataManager'

@Entry
@Component
struct CreateDocumentPage1 {
  @State name: string = ""
  @State gender: string = ""
  @State birthday: string = ""
  @State identity: string = ""
  @State step: number = 1
  @State cohabits: string[] = []
  @State foods: string[] = []
  @State toys: string[] = []
  @State cartoons: string[] = []

  build() {
    Navigation() {
      if (this.step == 1) {
        Step1View( {
          name: this.name,
          gender: this.gender,
          birthday: this.birthday,
          identity: this.identity,
          blockDidClickButton: () => {
            this.handleClickNext( )
          }
        } )
          .onClick( () => {
            KeyboardUtil.hide( )
          } )
      } else if (this.step == 2) {
        Step2View( {
          cohabits: this.cohabits,
          blockDidClickButton: () => {
            this.handleClickNext( )
          }
        } )
      } else if (this.step == 3) {
        Step3View( {
          foods: this.foods,
          toys: this.toys,
          cartoons: this.cartoons,
          blockDidClickFinish: () => {
            this.handleClickFinish( )
          }
        } )
      }
    }
    .title( '创建档案' )
    .titleMode( NavigationTitleMode.Mini )
    .backButtonIcon( $r( 'app.media.Navbar_arrow_left' ) )
  }

  handleClickNext() {
    this.step += 1
  }

  handleClickFinish() {
    console.debug( 'handleClickFinish' )
    let token = XTDataManager.sharedInstance.getLoginInfo( ).token as string
    Net.post( APIs.save_document )
      .setHeaders( { token: token } )
      .setParams( {
        food: this.foods.join( ',' ),
        toy: this.toys.join( ',' ),
        cartoon: this.cartoons.join( ',' ),
        name: this.name,
        gender: this.gender,
        birthday: this.birthday,
        identity: this.identity
      } )
      .requestObject<ApiResult<DDLoginInfoModel>>( (data) => {
        if (data.code == 200) {
          JhProgressHUD.showSuccess( '创建档案成功' )
        } else {
          JhProgressHUD.showError( data.message as string )
        }
      }, (error) => {
        JhProgressHUD.showError( error.getMessage( ) as string )
      } )
  }
}

@Component
struct InputButton {
  @Prop title: string = ''
  @Prop placeHolder: string = ''
  @Link text: string
  @Prop canInput: boolean = false
  blockDidClickButton: () => void = () => {
  };

  constructor(title: string, placeholder: string, text: string, canInput: boolean, blockDidClickButton: () => void) {
    super( )
    this.title = title
    this.placeHolder = placeholder
    this.text = text
    this.canInput = canInput
    this.blockDidClickButton = blockDidClickButton
    this.build( )
  }

  build() {
    Column() {
      Row() {
        Image( $r( 'app.media.Login_Question' ) )
          .width( 16 )
          .aspectRatio( 1 )
        Text( this.title )
          .fontColor( 0x1D2129 )
          .fontSize( 14 )
          .fontWeight( 500 )
      }
      .margin( { left: 12 } )

      RelativeContainer() {
        Button( { type: ButtonType.Normal } ) {
          if (this.canInput) {
            TextInput( { placeholder: this.placeHolder, text: this.text } )
              .placeholderColor( 0xC9CDD4 )
              .fontColor( 0x1D2129 )
              .backgroundColor( Color.Transparent )
              .height( '100%' )
              .padding( 12 )// .enabled( this.canInput )
              .onChange( (value: string) => {
                console.debug( 'textChange: ' + value )
                this.text = value
              } )
              .foregroundColor( 0x1D2129 )
          } else {
            Text( this.text.length == 0 ? this.placeHolder : this.text )
              .fontColor( this.text.length == 0 ? 0xC9CDD4 : 0x1D2129 )
              .enabled( false )
              .width( '100%' )
              .height( '100%' )
              .margin( { left: 12 } )
          }
        }
        .onClick( this.blockDidClickButton )
        .backgroundColor( Color.Transparent )

        if (this.canInput == false) {
          Image( $r( 'app.media.Login_Question' ) )
            .width( 12 )
            .aspectRatio( 1 )
            .alignRules( {
              center: { anchor: '__container__', align: VerticalAlign.Center },
              right: { anchor: '__container__', align: HorizontalAlign.End }
            } )
            .margin( { right: 12 } )
        }
      }
      .margin( { left: 12, right: 12, top: 8 } )
      .height( 44 )
      .backgroundColor( this.text.length != 0 ? 0xE8F3FF : 0xF7F8FA )
      .borderRadius( 4 )
    }
    .alignItems( HorizontalAlign.Start )
  }
}

@Component
struct Step1View {
  @Link name: string
  @Link gender: string
  @Link birthday: string
  @Link identity: string
  blockDidClickButton: () => void = () => {
  };
  today = new Date();
  oldToday = new Date( this.today.setMonth( this.today.getMonth( ) - 1 ) );

  constructor(name: string, gender: string, birthday: string, identity: string, blockDidClickButton: () => void) {
    super( )
    this.name = name
    this.gender = gender
    this.birthday = birthday
    this.identity = identity
    this.blockDidClickButton = blockDidClickButton
    this.build( )
  }

  build() {
    RelativeContainer() {
      Column() {
        Text( '请完善孩子的档案信息' )
          .margin( { left: 12, top: 12 } )
          .textAlign( TextAlign.Start )
        Row() {
          Image( $r( 'app.media.Login_Question' ) )
            .width( 12 )
            .aspectRatio( 1 )
          Text( '数据仅用于测评.' )
            .fontColor( 0xC9CDD4 )
            .fontSize( 12 )
        }
        .margin( { left: 12, top: 4, right: 12 } )

        InputButton( {
          title: '孩子姓名',
          placeHolder: '请输入孩子姓名',
          text: this.name,
          canInput: true
        } )
          .margin( { top: 12 } )
          .onClick( () => {
            console.debug( 'click' )
          } )

        InputButton( {
          title: '孩子性别',
          placeHolder: '请选择孩子性别',
          text: this.gender,
          blockDidClickButton: () => {
            KeyboardUtil.hide( )
            DialogUtil.showTextPicker( {
              range: ['男生', '女生'],
              value: this.gender,
              onAccept: (result) => {
                this.gender = result.value as string
              },
              canLoop: false
            } )
          }
        } )
          .margin( { top: 12 } )

        InputButton( {
          title: '出生年月',
          placeHolder: '请选择孩子的出生年月',
          text: this.birthday,
          blockDidClickButton: () => {
            KeyboardUtil.hide( )
            DialogUtil.showDatePicker( {
              onAccept: (result) => {
                let date = new Date( result.year!, result.month!, result.day! )
                this.birthday = DateUtil.getFormatDateStr( date, 'yyyy-MM-dd' )
              },
              end: this.oldToday,
              selected: DateUtil.getFormatDate( this.birthday )
            } )
          }
        } )
          .margin( { top: 12 } )

        InputButton( {
          title: '家长身份',
          placeHolder: '请选择您的家长身份',
          text: this.identity,
          blockDidClickButton: () => {
            KeyboardUtil.hide( )
            DialogUtil.showTextPicker( {
              range: ['妈妈', '爸爸', '叔叔', '阿姨', '其他'],
              value: this.identity,
              onAccept: (result) => {
                this.identity = result.value as string
              },
              canLoop: false
              // alignment: DialogAlignment.Bottom
            } )
          }
        } )
          .margin( { top: 12 } )

      }
      .id( 'Column' )
      .width( '100%' )
      .alignItems( HorizontalAlign.Start )

      Button( { type: ButtonType.Normal } ) {
        RelativeContainer() {
          Text( '下一页' )
            .id( 'Text2' )
            .alignRules( {
              middle: { anchor: '__container__', align: HorizontalAlign.Center },
              center: { anchor: '__container__', align: VerticalAlign.Center },
            } )
            .fontColor( Color.White )
            .fontSize( 14 )
            .fontWeight( 600 )
        }
      }
      .onClick( () => {
        console.debug( this.name )
        console.debug( this.gender )
        console.debug( this.birthday )
        console.debug( this.identity )
        this.blockDidClickButton( )
      } )
      .alignRules( {
        middle: { anchor: '__container__', align: HorizontalAlign.Center },
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
      } )
      .borderRadius( 8 )
      .height( 44 )
      .margin( {
        top: 24,
        left: 12,
        right: 12,
      } )
    }
  }
}

@Component
struct Step2View {
  @Link cohabits: string[]
  @State allCohabits: string[] = ['爸爸', '妈妈', '爷爷', '奶奶', '外公', '外婆', '其他']
  blockDidClickButton: () => void = () => {
  };

  constructor(cohabits: string[], blockDidClickButton: () => void) {
    super( )
    this.cohabits = cohabits
    this.blockDidClickButton = blockDidClickButton
  }

  build() {
    RelativeContainer() {
      Column() {
        Text( '以下哪些人和您的孩子一同居住？' )
          .fontColor( 0x1D2129 )
          .fontSize( 20 )
          .fontWeight( 600 )
          .margin( { left: 12 } )

        ForEach( this.allCohabits, (item: string) => {
          ListItem() {
            Row() {
              Checkbox( )
                .shape( CheckBoxShape.ROUNDED_SQUARE )
                .select( this.cohabits.includes( item ) )
                .enabled( false )
                .width( 14 )
                .aspectRatio( 1 )
                .selectedColor( 0x165DFF )
              Text( item )
            }
            .width( '100%' )
            .height( 48 )
          }
          .borderRadius( 4 )
          .backgroundColor( this.cohabits.includes( item ) ? 0xE8F3FF : Color.Transparent )
          .margin( { top: 12, left: 12, right: 12 } )
          .onClick( () => {
            if (this.cohabits.includes( item ) == false) {
              this.cohabits.push( item )
            } else {
              this.cohabits = this.cohabits.filter( (value) => {
                return value != item
              } )
            }
          } )
        } )
      }
      .id( 'Column' )
      .alignItems( HorizontalAlign.Start )

      Button( { type: ButtonType.Normal } ) {
        RelativeContainer() {
          Text( '下一页' )
            .id( 'Text2' )
            .alignRules( {
              middle: { anchor: '__container__', align: HorizontalAlign.Center },
              center: { anchor: '__container__', align: VerticalAlign.Center },
            } )
            .fontColor( Color.White )
            .fontSize( 14 )
            .fontWeight( 600 )
        }
      }
      .onClick( () => {
        this.blockDidClickButton( )
      } )
      .alignRules( {
        middle: { anchor: '__container__', align: HorizontalAlign.Center },
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
      } )
      .borderRadius( 8 )
      .height( 44 )
      .margin( {
        top: 24,
        left: 12,
        right: 12,
      } )
    }

  }
}

@Component
struct Step3View {
  scroller: Scroller = new Scroller()
  @Link foods: string[]
  @Link toys: string[]
  @Link cartoons: string[]
  blockDidClickFinish: () => void = () => {
  };

  constructor(foods: string[], toys: string[], cartoons: string[], blockDidClickFinish: () => void) {
    super( )
    this.foods = foods
    this.toys = toys
    this.cartoons = cartoons
    this.blockDidClickFinish = blockDidClickFinish
  }

  build() {
    RelativeContainer() {
      Scroll( this.scroller ) {
        Column( { space: 12 } ) {
          Text( '您的孩子的兴趣爱好有哪些？' )
            .fontSize( 20 )
            .fontWeight( 600 )
            .fontColor( 0x1D2129 )

          DDTagSelectView( {
            title: '喜欢的食物',
            selectedTags: this.foods,
            allTags: ['水果糖', '棉花糖', '冰淇淋', '饼干', '可乐', '爆米花', '汉堡', '其他']
          } )

          DDTagSelectView( {
            title: '喜欢的玩具',
            selectedTags: this.toys,
            allTags: ['乐高积木', '毛绒玩偶', '汽车模型', '沙子', '芭比娃娃', '黏土 / 橡皮泥', '其他']
          } )

          DDTagSelectView( {
            title: '喜欢的卡通人物',
            selectedTags: this.cartoons,
            allTags: ['小猪佩奇', '花园宝宝', '超级飞侠', '喜羊羊', '宝宝纠纠', '汪汪队', '其他']
          } )
        }
        .margin( { left: 12, right: 12 } )
        .width( '100%' )
        .alignItems( HorizontalAlign.Start )
      }

      Button( { type: ButtonType.Normal } ) {
        RelativeContainer() {
          Text( '完成' )
            .alignRules( {
              middle: { anchor: '__container__', align: HorizontalAlign.Center },
              center: { anchor: '__container__', align: VerticalAlign.Center },
            } )
            .fontColor( Color.White )
            .fontSize( 14 )
            .fontWeight( 600 )
        }
      }
      .onClick( this.blockDidClickFinish )
      .alignRules( {
        middle: { anchor: '__container__', align: HorizontalAlign.Center },
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
      } )
      .borderRadius( 8 )
      .height( 44 )
      .margin( {
        top: 24,
        left: 12,
        right: 12,
      } )
    }
  }
}

@Component
struct DDTagSelectView {
  @Prop title: string
  @Link selectedTags: string[]
  @Prop allTags: string[]

  build() {
    Column() {
      Text( this.title )
        .fontSize( 15 )
        .fontColor( 0xC9CDD4 )
      Flex( { wrap: FlexWrap.Wrap, direction: FlexDirection.Row } ) {
        ForEach( this.allTags, (item: string) => {
          Text( item )
            .margin( { left: 8, bottom: 8 } )
            .padding( { left: 8, right: 8 } )
            .height( 40 )
            .textAlign( TextAlign.Center )
            .maxLines( 1 )
            .borderRadius( 4 )
            .backgroundColor( this.selectedTags.includes( item ) ? 0xE8F3FF : 0xF2F3F5 )
            .onClick( () => {
              if (this.selectedTags.includes( item ) == false) {
                this.selectedTags.push( item )
              } else {
                this.selectedTags = this.selectedTags.filter( (value) => {
                  return value != item
                } )
              }
              console.debug( this.selectedTags.toString( ) )
            } )
        } )
      }
      .margin( { top: 12 } )
    }
    .alignItems( HorizontalAlign.Start )
    .width( '100%' )
  }
}