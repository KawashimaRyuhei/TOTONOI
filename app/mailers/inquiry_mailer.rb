class InquiryMailer < ApplicationMailer
  default from: 'desunakano333@gmail.com'

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: inquiry.email, subject: 'お問い合わせを承りました')
  end
end
