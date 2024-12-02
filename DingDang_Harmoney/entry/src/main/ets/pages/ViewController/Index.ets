import { router, RouterOptions } from '@kit.ArkUI';
import { MyNewView } from '../View/MyNewView';

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State message: string = 'Hello World';
  public test: string = '123';
  private option: router.RouterOptions = {
    url: "pages/Second"
  }

  build() {
    Scroll( this.scroller ) {
      Column( { space: 40 } ) {
        Text( this.message )
          .id( 'HelloWorld' )
          .fontSize( 14 )
          .fontWeight( FontWeight.Bold )
          .alignRules( {
            middle: { anchor: '__container__', align: HorizontalAlign.Center },
            top: { anchor: '__container__', align: VerticalAlign.Top }
          } )
        Button( 'My Button' ).onClick( (event: ClickEvent) => {
          this.myFunc( )
          router.pushUrl( this.option )
        } )
          .alignRules( {
            // middle: { anchor: '__container__', align: HorizontalAlign.Center},
            top: { anchor: '__container__', align: VerticalAlign.Bottom },
            left: { anchor: '__container__', align: HorizontalAlign.Start }
          } )
        MyNewView( )
      }
      .alignRules( {
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      } )
      .width( '100%' )
    }
  }

  myFunc(name: String = '123') {
    let test = 123
    this.message = '456'
    this.getUIContext( ).getFrameNodeById( '123' )
    return test
  }

  @Builder
  myFunc2() {
    Row() {
      Text( '123' )
    }

    Column() {

    }
  }
}