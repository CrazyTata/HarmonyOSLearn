import { preferences, ValueType } from '@kit.ArkData'

const TAG:string=''

export class  PreferencesUtils{
  //存储多个PS，用MAP集合
  prefMap:Map<string,preferences.Preferences>= new Map
  //初始化存储对象  异步
  async loadPreferences(context:Context,name:string){
    try {
      const pref = await preferences.getPreferences(context,name)
      this.prefMap.set(name,pref)
      console.log(TAG,`初始化${name}成功`)
    }catch (e){
      console.log(TAG,`初始化${name}失败，错误原因：${e}}`)
    }
  }

  //添加数据
  async putPreferences(name:string,key:string,value:preferences.ValueType){
    //先判断是否存在
    if (!this.prefMap.has(name)){
      console.log(TAG,`初始化${name}失败`)
      return
    }

    try {
      const pref = this.prefMap?.get(name)
      //写入数据
      await pref?.put(key,value)
      //刷盘
      await pref?.flush()
      console.log(TAG,`存储${name}成功`)
    }catch (e){
      console.log(TAG,`存储${name}失败，错误原因：${e}}`)
    }
  }

  //获取数据
  async getPreferences(name:string,key:string) {
    //先判断是否存在
    if (!this.prefMap.has(name)) {
      console.log(TAG, `初始化${name}失败`)
      return ''
    }

    try {
      const pref = this.prefMap?.get(name)
      //写入数据
      let value = await pref?.get(key,'')
      console.log(TAG, `读取${name}成功`)
      return value
    } catch (e) {
      console.log(TAG, `读取${name}失败，错误原因：${e}}`)
      return ''
    }
  }

  async deletePreferences(name:string,key:string) {
    if (!this.prefMap.has(name)) {
      console.log(TAG, `初始化${name}失败`)
      return
    }
    try {
      const pref = this.prefMap?.get(name)
      //删除数据
      let value = await pref?.delete(key)

      await pref?.flush()

      console.log(TAG, `删除${name}成功`)
    } catch (e) {
      console.log(TAG, `删除${name}失败，错误原因：${e}}`)
    }
  }
}

const mPreferencesUtil = new PreferencesUtils()

export default mPreferencesUtil as PreferencesUtils