class Product < ApplicationRecord
  # 定数を使ってステータスを管理
  enum status: { draft: 0, published: 1, closed: 2 }

  validates :name,       presence: true
  #整数のみを入力してもらうようにバリデーションをかける
  #値は0より大きいこと,defalutではnil値は許容されないので、allow_ nil:trueをつける
  validates :selllimit,  numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :price,      numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  # on: を使って値がなくても一旦保存できるようにする。
  # ただし公開する場合は必須項目とする
  validates :description, presence: true, on: :published
  validates :price,       presence: true, on: :published
  validates :selllimit,   presence: true, on: :published
  
end
