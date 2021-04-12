class ContactMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact
        mail to:"totonoizm@gmail.com",subject:"お問い合わせ"
    end
end
