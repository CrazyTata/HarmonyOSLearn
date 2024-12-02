interface IAward
{
  image?:string|Resource;
  name:string;
  loop?:number;
}

let awardInfo:Array<IAward> = [
  {image:$rawfile('wheelImg/1.jfif'),name:'手机',loop:0},
  {image:$rawfile('wheelImg/2.webp'),name:'食用油',loop:1},
  {image:$rawfile('wheelImg/3.webp'),name:'大米',loop:2},
  {image:$rawfile('wheelImg/4.webp'),name:'PC',loop:7},
  {name:'开始抽奖'},
  {image:$rawfile('wheelImg/5.webp'),name:'液晶电视',loop:3},
  {image:$rawfile('wheelImg/6.webp'),name:'PAD',loop:6},
  {image:$rawfile('wheelImg/7.webp'),name:'烤箱',loop:5},
  {image:$rawfile('wheelImg/8.jpeg'),name:'谢谢老板',loop:4},
]

export {IAward,awardInfo}