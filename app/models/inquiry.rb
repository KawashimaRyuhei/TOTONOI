class Inquiry
  include ActiveModel::Model

  attr_accessor :name, :email, :message

  validates :name, presence: { message: '名前を入力してください' }
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: 'メールアドレスを入力してください' }
  validates :message, presence: { message: 'メッセージを入力してください' }
end
