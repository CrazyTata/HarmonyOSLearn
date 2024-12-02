export class DDLoginInfoModel {
  token: string = ''
  user: string = ''
  status: number = 0
  children_id: number = 0
}

export class ApiResult<T> {
  code?: number
  message?: string
  data?: T
}