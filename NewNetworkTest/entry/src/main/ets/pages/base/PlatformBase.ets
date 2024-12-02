/**
 * @ProjectName : NetworkTest
 * @FileName : CityBase
 * @UserName : 修梦
 * @Time : 2024/8/25 22:05
 * @Description : 城市数据Class类
 */
export class PlatformBase {
 /*
  "code": 200,
    "title": "哔哩哔哩",
    "subtitle": "全站日榜",
    "update_time": "2024-08-22 12:50:58",*/
  code: number = 0
  title: string = ''
  subtitle: string = ''
  update_time : string = ''
  data: Array<platformData> = []

}
 export  class platformData{
   /*
    * "index": 4,
            "title": "据说 今天不少外国网友都在打听一只“猴子”的身世~",
            "pic": "http://i0.hdslb.com/bfs/archive/d9eddbe3d5b93f6cf441a4a6c2e32fbd824209c3.jpg",
            "desc": "",
            "hot": "456.2万",
            "url": null,
            "mobilUrl": null*/
  index: number = 0
  title:string = ''
  pic:string = ''
  desc :string = ''
  hot :string = ''
  url :string = ''
  mobilUrl :string = ''
}