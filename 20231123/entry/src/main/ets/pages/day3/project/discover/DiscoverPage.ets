import { PlatformBase, PlatformBaseData } from "../base/PlatformBase";
import { PlatformApi } from "../http/AxiosAPI";
import { PlatformItemPage } from "./PlatformItemPage";

@Entry
@Component
export struct DiscoverPage {

  @State platformBase:PlatformBase = new PlatformBase()

  async aboutToAppear(): Promise<void> {
    let result:PlatformBase = await PlatformApi()
    console.log("tata:"+JSON.stringify(result))
    this.platformBase = result
  }
  build() {
    Column(){
      List({space: 10}){
        ForEach(this.platformBase.data,(item: PlatformBaseData) => {
          PlatformItemPage({platformItem: item})
        })
      }
      .margin({top: 10})
      .alignListItem(ListItemAlign.Center)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Yellow)
  }
}

//   build() {
//     Column(){
//      List({space:10}){
//        ForEach(this.platformBase.data,(item:PlatformBaseData,idx:number)=>{
//           PlatformItemPage({
//             platformItem:item
//           })
//        }
//        )
//      }
//      .margin({top:10})
//      .alignListItem(ListItemAlign.Center)
//       .scrollBar(BarState.Off)
//     }
//     .height('100%')
//     .width('100%')
//     .backgroundColor(Color.Yellow)
//   }
// }