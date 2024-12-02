@Entry
@Component
struct EvalutionViewController {
  @State message: string = 'Hello World';

  build() {
    Navigation() {
      RelativeContainer() {
        Text( this.message )
          .id( 'EvalutionViewControllerHelloWorld' )
          .fontSize( 50 )
          .fontWeight( FontWeight.Bold )
          .alignRules( {
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          } )
      }
    }
    .titleMode( NavigationTitleMode.Mini )
    .backButtonIcon( $r( 'app.media.Navbar_arrow_left' ) )
    .height( '100%' )
    .width( '100%' )
  }
}