/**
 * @ProjectName : HealthyDiet
 * @FileName : RequestOptions
 * @UserName : 修梦
 * @Time : 2024/7/29 00:50
 * @Description : 文件描述
 */
import json from '@ohos.util.json';
import HttpHeader from './HttpHeader';

export interface RequestOptions {
  url: string;
  method?: RequestMethod;
  queryParams?: Record<string, string>;
  extraData?: string | Object | ArrayBuffer;
  header?: Map<string,string>
}
export enum RequestMethod{
  OPTIONS = "OPTIONS",
  GET = "GET",
  HEAD = "HEAD",
  POST = "POST",
  PUT = "PUT",
  DELETE = "DELETE",
  TRACE = "TRACE",
  CONNECT = "CONNECT"
}