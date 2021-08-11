class Store < ApplicationRecord
  with_options presence: true do
    validates :name, :address, :postal_code, :telephone, :url, :closing_day, :business_hour, :fee, :water, :temperature, :television, :bgm
  end

  belongs_to :user
end
