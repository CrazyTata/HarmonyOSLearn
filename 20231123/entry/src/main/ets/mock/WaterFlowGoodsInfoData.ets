interface IGoodsItem
{
  goods_name:string,
  goods_price:number,
  goods_img:string|ResourceStr;
  goods_count:number;
  id:number;
}

let waterFlowData:Array<IGoodsItem> = [
  {goods_name:"海青蓝金丝绒提花连衣裙女秋冬新款气质复古高级感收腰假两件裙子",goods_price:288,goods_img:'http://img.alicdn.com/img/i4/31725748/O1CN01EMtSwH1sKdZP3MGFO_!!0-saturn_solar.jpg_580x580q90.jpg_.webp',goods_count:123,id:1},
  {goods_name:"设计感小众polo衫短袖t恤女夏季2024新款学生宽松半袖上衣纯棉",goods_price:25.80,goods_img:'https://gw.alicdn.com/imgextra/O1CN01PMjfg21mQEhrdRtyh_!!2206588314948-0-C2M.jpg_580x580q90.jpg_.webp',goods_count:23,id:2}
  ,
  {goods_name:"短袖t恤女夏季纯棉拼接撞色2024新款卡通学生ins显瘦上衣插肩印花",goods_price:31.06,goods_img:'https://gw.alicdn.com/imgextra/O1CN01ijH7xX2LY20XHCUPx_!!3937219703-0-C2M.jpg_580x580q90.jpg_.webp',goods_count:42,id:3}
  ,
  {goods_name:"恒源祥V领针织衫女开衫2024春秋新款100纯羊毛衫外穿纽扣毛衣外套",goods_price:199,goods_img:'https://gw.alicdn.com/imgextra/O1CN018CzmeM2GLbB1ZvPRa_!!908948999-0-picasso.jpg_580x580q90.jpg_.webp',goods_count:54,id:4}
  ,
  {goods_name:"白色纯棉长袖t恤女秋装2024新款女装时尚春秋打底衫女士体恤上衣",goods_price:49,goods_img:'http://img.alicdn.com/img/i3/42278173/O1CN01aHDQ9p2AFHrlUOUGw_!!0-saturn_solar.jpg_580x580q90.jpg_.webp',goods_count:33,id:5}
  ,
  {goods_name:"夏季配吊带裙的小外搭披肩短款网纱冰丝开衫简约百搭防晒罩衫坎肩",goods_price:28.9,goods_img:'https://g-search1.alicdn.com/img/bao/uploaded/i4/i2/3954788283/O1CN015UV7hW2B3fZiyxK3k_!!0-item_pic.jpg_580x580q90.jpg_.webp',goods_count:24,id:6}
  ,
  {goods_name:"高端品哥弟新2024夏季新款桑蚕丝女短袖t恤针织衫冰丝显瘦上衣",goods_price:148,goods_img:'http://img.alicdn.com/img/i3/33012020/O1CN017oMEz31QnD1RoVhJI_!!0-saturn_solar.jpg_580x580q90.jpg_.webp',goods_count:106,id:7}
  ,
  {goods_name:"EUSKY IIWAN 白色雪纺衬衫女夏秋垂感气质长袖衬衣洋气别致上衣",goods_price:189,goods_img:'http://img.alicdn.com/img/i2/2334920077/O1CN01F7ii661CRJMYSDIUN_!!0-saturn_solar.jpg_580x580q90.jpg_.webp',goods_count:16,id:8}
  ,
  {goods_name:"罗衣气质高级藏青色西装女2024秋季新款时尚通勤修身小外套10105",goods_price:278,goods_img:'https://img.alicdn.com/imgextra/i4/133708381/O1CN01jzWhOh2BmYP2Y5nWE_!!133708381-0-alimamacc.jpg_580x580q90.jpg_.webp',goods_count:59,id:9}
  ,
  {goods_name:"新中式妈妈夏装套装2024新款国风桑蚕丝上衣中老年女短袖两件套",goods_price:128,goods_img:'http://img.alicdn.com/img/i4/35494784/O1CN017LklwT1lD7kDSTWFM_!!0-saturn_solar.jpg_580x580q90.jpg_.webp',goods_count:34,id:10}
];

export {IGoodsItem,waterFlowData}