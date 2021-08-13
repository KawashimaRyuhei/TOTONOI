class Store < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :name, :address, :postal_code, :telephone, :url,
              :closing_day, :business_hour, :fee, :water, :temperature,
              :television, :bgm, :image
  end
end
