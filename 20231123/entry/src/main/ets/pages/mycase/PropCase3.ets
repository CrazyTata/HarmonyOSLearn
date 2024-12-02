import { promptAction } from '@kit.ArkUI';
import { IGoodsItem, waterFlowData } from '../../mock/WaterFlowGoodsInfoData';

@Entry
@Component
struct Index {
  @State data:Array<IGoodsItem> = waterFlowData;
  @State isShow:boolean = false;
  @State selectedImageList:Array<IGoodsItem> = [];
  build() {
    Column() {
      Button("选择图片")
        .onClick(()=>{
          this.isShow = !this.isShow;
        }).margin(10);
      if(this.isShow) {
        IGoodsItemComp({IGoodsItemList:this.data,close:()=>{
          this.isShow = false;
        },showSelectedImageList:(list:Array<IGoodsItem>)=>{
          let newList = list.filter(IGoodsItem =>{
              let idx = this.selectedImageList.findIndex((item:IGoodsItem)=>{
                  return IGoodsItem.id == item.id;
                })
              return idx == -1;
            })
          this.selectedImageList.push(...newList);
          this.isShow = false;
        }
        });
      } else {
        Scroll() {
          Grid() {
            ForEach(this.selectedImageList, (IGoodsItem: IGoodsItem) => {
              GridItem() {
                Image(IGoodsItem.goods_img).aspectRatio(1);
              }
            })
          }.rowsGap(8)
          .columnsGap(8)
          .columnsTemplate("1fr 1fr")
          .padding(8)
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}

@Component
struct IGoodsItemComp {
  @Prop
  IGoodsItemList:Array<IGoodsItem>;
  close?:()=>void;
  maxNum:number = 5;

  @State
  currentNum:number = 0;
  selectedItem:Array<IGoodsItem> = [];
  showSelectedImageList:(list:Array<IGoodsItem>)=>void = ()=>{};
  selectImage(item:IGoodsItem) {
    let idx = this.selectedItem.findIndex((e1)=>{
      return e1.id === item.id;
    })
    if(idx > -1) {
      this.selectedItem.splice(idx,1);
    } else {
      if(this.selectedItem.length >= this.maxNum) {
        promptAction.showToast({message:`无法进行添加图片，已超过最大值${this.maxNum}`})
        return;
      }
      this.selectedItem.push(item);
    }
    this.currentNum = this.selectedItem.length;
  }

  getSelectedState(item:IGoodsItem):boolean {
    let idx = this.selectedItem.findIndex((e)=>{
      return e.id === item.id;
    }) ;
    return idx > -1;
  }

  build() {
    Column() {
      Grid() {
        ForEach(this.IGoodsItemList,(e:IGoodsItem,idx:number)=>{
          GridItem(){
            Stack({alignContent:Alignment.BottomEnd}) {
              Image(e.goods_img).aspectRatio(1).onClick(()=>{
                this.selectImage(e);
              });
              if(this.getSelectedState(e))
              {
                Image($r('app.media.startIcon'))
                  .width(24)
                  .aspectRatio(1)
                  .fillColor('#47eb1d');
              }
            }
          }
        })
      }.width('100%')
      .height('100%')
      .padding(10)
      .columnsGap(8)
      .rowsGap(8)
      .columnsTemplate('1fr 1fr 1fr')
      .layoutWeight(1)
      Row() {
        Button("取消").onClick(this.close)
          .backgroundColor(Color.Gray);
        Text(`已选${this.currentNum}/可选${this.maxNum}张`);
        Button("完成").onClick(()=>{
          this.showSelectedImageList(this.selectedItem);
        });
      }.justifyContent(FlexAlign.SpaceBetween)
      .padding(10)
      .width('100%');
    }
  }
}