class UserMailer < ActionMailer::Base
  def welcome_mail(recipient,login_url,password)
    @recipients = recipient
    @subject = "Softweb Solutions Sign UP"
    @login_url = login_url
    @password = password
    #   @from = 'no-reply@yourdomain.com'
    @sent_on = Time.now
    @body["title"] = 'Welcome to Pirya Softweb Solution'
#   @body["url"] = '<% login_url %>'
    @headers = {}
  end
  def password_reset(user)
  	@user = user
  	@recipients = @user.email
    @subject = 'Password Reset Informations'
  	@sent_on = Time.now
  	@body["title"] = 'Password Reset'
  	@headers = {}
  end
end
