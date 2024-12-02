export class DDPracticeListModel {
  list: DDPracticeModel[] = []
  page = 1
  pageSize = 0
  total = 0
}

export class DDPracticeModel {
  abstract = ""
  adults = 0
  area = ""
  children = 0
  created_at = ""
  explanation = ""
  id: number = 0
  image = ""
  introduction = ""
  kf_id = ""
  level = 0
  level_support = ""
  min_age = 0
  max_age = 0
  name = ""
  objective = ""
  reply = ""
  small_image = ""
  step = 0
  strategy_support = ""
  tag = ""
  teaching_images = ""
  time = 0
  updated_at = ""
  is_collected = false
  practice_id: number = 0
  success_times = 0
}