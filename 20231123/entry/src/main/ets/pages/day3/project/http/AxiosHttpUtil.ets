import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from "@ohos/axios";
import { promptAction } from "@kit.ArkUI";

export const instance = axios.create({
  baseURL: 'https://uapis.cn/api',
  timeout: 10000,
})

//请求拦截器

instance.interceptors.request.use((config:InternalAxiosRequestConfig)=>{
  //在发送请求之前做些什么
  const token =AppStorage.get<string>('token')
  if (token){
    // config.headers.Authorization = `Bearer ${token}`
    config.headers['token'] = token
  }
  return config
},(error:AxiosError)=>{
  promptAction.showToast({message:'网络异常'})
  console.log('httpAxios error'+JSON.stringify(error))
  return Promise.reject(error)
})

instance.interceptors.response.use((response:AxiosResponse)=>{
  console.log('httpAxios response'+JSON.stringify(response))
  if (response.data.code==200){
    return response
  }
  promptAction.showToast({message:'网络异常'})
  console.log('httpAxios response'+JSON.stringify(response))
  return Promise.reject('网络异常')
},(error:AxiosError)=>{
  promptAction.showToast({message:'网络异常'})
  console.log('httpAxios error'+JSON.stringify(error))
  return Promise.reject(error)
})