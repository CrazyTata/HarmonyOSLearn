import { AxiosResponse } from "@ohos/axios";
import { instance } from "./AxiosHttpUtil";

export async function PlatformApi(){
  const response:AxiosResponse = await instance.get('/hotlist?type=bilibili')
  return response.data
}