///  APIs.ets
///
///  Created by iotjin on 2024/08/08.
///  description: api管理

export class APIs {
  /// url 前缀
  static readonly apiPrefix: string = 'https://dingapitest.whitexiaomao.com'
  /// 短信接口
  static readonly login_send_sms: string = '/login/send-sms'
  /// 短信登陆
  static readonly login_by_code: string = '/login/login-by-code'
  /// 获取用户信息
  static readonly get_user: string = '/login/get-user'
  /// 保存档案
  static readonly save_document: string = '/children/save'
  /// 获取档案
  static readonly children_get = "/children/get"
  /// 练习列表
  static readonly practice_list = "/practice/list"
}