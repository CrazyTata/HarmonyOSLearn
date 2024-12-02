@Entry
@Component
struct BuildParamsCase {
  @State message: string = 'Hello World';

  build() {
    Column(){
      MyComponent({title:'tata',f:myFun11,f2:myFun22})
    }
    .height('100%')
    .width('100%')
    .backgroundColor(Color.Pink)
  }
}

@Builder function  myFun():void{}
@Builder function myFun1(s:string):void{}


@Builder function  myFun11():void {
  Text('tata func1 ')
    .width('100%')
    .height('10%')
    .backgroundColor(Color.Brown)
}



@Builder function  myFun22(s:string):void{
  Text('func2  1 ')
    .width('100%')
    .height('10%')
    .backgroundColor(Color.Orange)
  Text(s)
    .width('100%')
    .height('10%')
    .backgroundColor(Color.Gray)
}

@Component
struct MyComponent{

  title:string=''

  @BuilderParam
  f:()=>void = myFun

  @BuilderParam
  f2:(s:string)=>void = myFun1


  build() {
    Column(){
      this.f()
      Text('ada')
      this.f2(this.title)
    }
  }
}

function myStyle() {
  throw new Error('Function not implemented.');
}
