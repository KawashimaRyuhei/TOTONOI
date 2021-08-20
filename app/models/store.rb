class Store < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  belongs_to :user
  has_many_attached :images
  
  with_options presence: true do
    validates :name, :address, :postal_code, :telephone, :url,
              :closing_day, :business_hour, :fee, :water, :temperature,
              :roryu_status, :roryu_time, :air_bath, :break_place, :television, :bgm, :water_depth, :images
  end

  def favorited_by?(user)
    goods.where(user_id: user.id).exists?
  end
end
