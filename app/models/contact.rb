class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 2,maximum: 10 }
  validates :email, presence: true, length: { minimum: 2,maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 100 }

  def send_mail(contact)
    @contact = contact
    mail to:   ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject_i18n
  end
end
