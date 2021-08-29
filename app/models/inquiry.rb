class Inquiry
  include ActionModel::Model

  attr_accessor :name, :email, :message

  validates :name, presence: true, format: {message: "名前を入力してください"}
  validates :email, presence: true, format: {message: "メールアドレスを入力してください"}
end