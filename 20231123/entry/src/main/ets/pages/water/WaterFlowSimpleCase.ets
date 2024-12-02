@Entry
@Component
struct WaterFlowSimpleCase {
  @State message: string = 'Hello World';

  build() {
   WaterFlow(){
       FlowItem() {
         Image('https://img2.baidu.com/it/u=1845634659,766211561&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1400')
           .height(300)
       }

       FlowItem() {
         Image('https://img1.baidu.com/it/u=922847932,2985620342&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800')
           .height(200);
       }

       FlowItem() {
         Image('https://mvideopic.bdstatic.com/mvideo/6afefa07c4c3aaff8e6154a5def8159f.jpg?for=bg')
           .height(300);
       }

       FlowItem() {
         Image('https://img1.baidu.com/it/u=1651562765,4082432317&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500')
           .height(200);
       }

       FlowItem() {
         Image('https://img2.baidu.com/it/u=1845634659,766211561&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1400')
           .height(300);
       }

       FlowItem() {
         Image('https://img1.baidu.com/it/u=922847932,2985620342&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800')
           .height(200);
       }

       FlowItem() {
         Image('https://img0.baidu.com/it/u=4017381117,4023275010&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889')
           .height(300);
       }

       FlowItem() {
         Image('https://img2.baidu.com/it/u=390623835,2671317295&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800')
           .height(200);
       }
     }.columnsTemplate('1fr 1fr')
   .columnsGap(5) .rowsGap(5) .padding(10).width('100%')
   .height('100%')
   }
}