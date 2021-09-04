class Contact < ApplicationRecord

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 50 }
  validates :subject, presence: true, length: { maximum: 20 }
  validates :message, presence: true, length: { maximum: 100 }

  def send_mail(contact)
    @contact = contact
    mail to:   ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject_i18n
  end
end
