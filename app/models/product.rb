class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_products, dependent: :destroy
  has_many :cart, through: :cart_products
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
  validate  :validates_image

  def to_key
    [to_hash_id(id)]
  end

  def to_param
    to_hash_id(id)
  end

  def convert_hash_id(id)
    Hashids.new("test").encode(id.to_s)
  end

  def validates_image
    return unless image.attached?
    if image.blob.byte_size > 10.megabytes
      image.purge
      errors.add(:image, I18n.t('errors.messages.file_too_large'))
    elsif !image?
      image.purge
      errors.add(:image, I18n.t('errors.messages.file_type_not_image'))
    end
  end

  def image?
     %w[image/jpg image/jpeg image/gif image/png].include?(image.blob.content_type)
  end
  
end
