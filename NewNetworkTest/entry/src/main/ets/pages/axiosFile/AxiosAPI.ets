/**
 * @ProjectName : NetworkTest
 * @FileName : AxiosAPI
 * @UserName : 修梦
 * @Time : 2024/8/25 21:51
 * @Description : 具体对网络请求
 */
import { AxiosResponse } from '@ohos/axios'
import { LoverWordsBase } from '../base/LoverWordsBase'
import { instance } from './AxiosPage'
//获取第一条信息
export async function PlatformApi() {
  const response:AxiosResponse = await instance.get('https://uapis.cn/api/hotlist?type=bilibili')
  return response.data
}

export async function loverWordsApi() {
  const response:AxiosResponse = await instance.get('https://api.lovelive.tools/api/SweetNothings/2/Serialization/Json')
  return response.data
}
