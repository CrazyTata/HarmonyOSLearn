import { DateUtil } from "@pura/harmony-utils"

export class DDUserInfoModel {
  id: number = 0
  user: string = ''
  user_type: number = 0
  nickname: string = ''
  mobile: string = ''
  level: number = 0
  fee_level: number = 0
  level_expire: string = ''
  name: string = ''
  status: number = 0
  avatar: string = ''
  gender: number = 0
  unionid: string = ''
  openid: string = ''
  province: string = ''
  city: string = ''
  country: string = ''
  birthday: string = ''
  constellation: string = ''
  invitation_code: string = ''
  level_start: string = ''
  created_at: string = ''
  updated_at: string = ''
  children_id: number = 0

  public get remain(): number {
    let date = DateUtil.getFormatDate( this.level_expire )
    let today = new Date()
    return DateUtil.compareDays( date, today )
  }
}