import { JSONUtil, PreferencesUtil } from "@pura/harmony-utils";
import { DDDocumentListModel } from "../Model/DDDocumentListModel";
import { DDLoginInfoModel } from "../Model/DDLoginInfoModel";
import { DDUserInfoModel } from "../Model/DDUserInfoModel";
import { router } from "@kit.ArkUI";
import { router_LoginViewController } from "./RouterFile";

export class XTDataManager {
  static sharedInstance: XTDataManager = new XTDataManager();
  documentList: DDDocumentListModel = new DDDocumentListModel();

  private constructor() {
  }

  /*获取用户身份随机码*/
  getUserRandomKey() {
    let infoStr = PreferencesUtil.getStringSync( 'XTUserRandomKey' )
    return infoStr
  }

  /*保存用户身份随机码*/
  saveUserRandomKey(key: string) {
    let currentKey = this.getUserRandomKey( )
    if (currentKey.length == 0) {
      PreferencesUtil.putSync( 'XTUserRandomKey', key )
    }
  }

  /*重置用户身份随机码*/
  resetUserRandomKey() {
    PreferencesUtil.putSync( 'XTUserRandomKey', '' )
  }

  /*获取登陆信息*/
  getLoginInfo(): DDLoginInfoModel {
    let infoStr = PreferencesUtil.getStringSync( 'XTLoginInfoModel' )
    let model = JSONUtil.jsonToBean( DDLoginInfoModel, infoStr ) as DDLoginInfoModel
    if (model == null) {
      return new DDLoginInfoModel()
    }
    return model
  }

  /*保存登陆信息*/
  saveLoginInfo(model: DDLoginInfoModel) {
    let str = JSONUtil.beanToJsonStr( model );
    PreferencesUtil.putSync( 'XTLoginInfoModel', str )
  }

  /*删除登陆信息*/
  deleteLoginInfo() {
    PreferencesUtil.deleteSync( 'XTLoginInfoModel' )
  }

  /*获取登陆信息*/
  getUserInfo(): DDUserInfoModel {
    let infoStr = PreferencesUtil.getStringSync( 'XTUserInfoModel' )
    let model = JSONUtil.jsonToBean( DDUserInfoModel, infoStr ) as DDUserInfoModel
    return model
  }

  /*保存登陆信息*/
  saveUserInfo(model: DDUserInfoModel) {
    let str = JSONUtil.beanToJsonStr( model );
    PreferencesUtil.putSync( 'XTUserInfoModel', str )
  }

  /*删除登陆信息*/
  deleteUserInfo() {
    PreferencesUtil.deleteSync( 'XTUserInfoModel' )
  }
}