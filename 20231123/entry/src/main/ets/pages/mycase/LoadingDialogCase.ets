import { IGoodsItem, waterFlowData } from "../../mock/WaterFlowGoodsInfoData";

//弹出层样式
@Preview
@CustomDialog
struct MyLoadingDialog {
  loadingDialogController:CustomDialogController = new CustomDialogController({builder:[]})
    build() {
    Row({space:10}) {
      Text('数据加载中...') .fontSize(14) .fontWeight(FontWeight.Bold);
      LoadingProgress().width(20);
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Center)
    .padding(10)
  }
}

//相册子组件
@Entry
@Component
struct ComAlbum {
  loadingDialogController:CustomDialogController = new CustomDialogController({
      builder:MyLoadingDialog(),
      customStyle:false, //不要使用dialog提供的样式
      alignment:DialogAlignment.Bottom,
      offset:{dx:0,dy:-20}
    });

  //取消逻辑，可以用来关闭子组件，显示父组件的内容
  cancelAlbum:()=>void = ()=>{};

  @State albumList:Array<IGoodsItem> = [];
  @State loading:boolean = true;

  async aboutToAppear(): Promise<void> {
    //启动我们的自定义弹出层
    this.loadingDialogController.open();
    let result = await new Promise<string>((resolve,reject)=>{
      setTimeout(()=>{
        this.albumList.push(...waterFlowData);
        //返回OK
        resolve('ok');
      },3000);
    })

    if(result === 'ok') {
      //展示网络相册清单
      this.loading = false;
      //关闭弹出层
      this.loadingDialogController.close();
    }
  }

  @State selectedAlbum:Array<IGoodsItem>=[];

  isExists(album:IGoodsItem):boolean {
    let idx:number = this.selectedAlbum.findIndex((item:IGoodsItem,idx:number)=>{
        return album.goods_img === item.goods_img;
      })
    return idx !=-1 ;
  }

build() {
  Column() {
    if(!this.loading) {
      Grid(){
        ForEach(this.albumList,(album:IGoodsItem,idx:number)=>{
          GridItem() {
            Stack({alignContent:Alignment.BottomEnd}) {
              Image(album.goods_img)
                .width(200)
                .aspectRatio(1)
                .onClick(()=>{
                  //当点击图片的时候，如果图片存在于当前的选择数组(selectedAlbum)
                  // 移除图片，否则添加图片，刷新UI
                  if(this.isExists(album)) {
                    this.selectedAlbum.splice(idx,1)
                  }else {
                    this.selectedAlbum.push(album)
                  }
                })

              if(this.isExists(album)) {
                Image($r('app.media.ic_gallery_material_select_checkbox'))
                  .width(24)
                  .fillColor(Color.Blue)
              }
            }
          }
        })
      }
      .layoutWeight(1)
      .padding(5)
      .columnsGap(5)
      .rowsGap(5)
      .columnsTemplate('1fr 1fr 1fr');
      //Row
      Row() {
        Button('取消')
          .onClick(()=>{
            this.selectedAlbum = [];
            this.cancelAlbum();
        });
        Row() {
          Text(`已选${this.selectedAlbum.length}/共有 ${this.albumList.length}张`);
        }.layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        Button('完成')
          .onClick(()=>{
            this.cancelAlbum();
        });
      }.width('100%')
      .height(50)
      .padding(5);
    }
  }.width('100%')
  .height('100%')
}
}