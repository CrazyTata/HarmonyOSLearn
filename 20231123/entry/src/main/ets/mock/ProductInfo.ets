interface IProduct
{
  id:string,
  name:string;
  image:string | Resource;
  price:number;
  discount?:number;
}


let productInfo:Array<IProduct> = [
  {id:'p1001',name:'华为Mate60',image:$rawfile('prodImg/1.jpg'),price:6999,discount:3999},
  {id:'p1002',name:'华为x50',image:$rawfile('prodImg/2.jfif'),price:8799},
  {id:'p1003',name:'小米14',image:$rawfile('prodImg/3.jpg'),price:4379,discount:3999},
  {id:'p1004',name:'OPPOFind12',image:$rawfile('prodImg/4.jpg'),price:3299,discount:2999},
  {id:'p1005',name:'荣耀100',image:$rawfile('prodImg/5.jfif'),price:3799},
  {id:'p1006',name:'OPPOFind12',image:$rawfile('prodImg/4.jpg'),price:3299,discount:2999},
  {id:'p1007',name:'荣耀100',image:$rawfile('prodImg/5.jfif'),price:3799}
];


export {IProduct,productInfo}