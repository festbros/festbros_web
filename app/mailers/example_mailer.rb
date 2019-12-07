class ExampleMailer < ActionMailer::Base
    default from: "festbrosapp@gmail.com"
    layout 'mailer'
    # def sample_email()
    #   mail(to:'festbrosapp@gmail.com', subject: 'Sample Email')
    # end
    def sample_email(name: name,email: email,subject: subject,message: message,mobile: mobile)
      @name = name
      @email = email
      @subject = subject
      @message = message
      @mobile = mobile
       mail(to:'festbrosapp@gmail.com', subject: 'New Eamil from Website'  ) 
    end
  end