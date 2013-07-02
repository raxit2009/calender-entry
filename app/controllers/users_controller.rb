class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    recipient = @user.email
    password = @user.password     
    @user.save!
    UserMailer.deliver_welcome_mail(recipient,login_url,password)
    flash[:notice] = 'User was successfully created.'
    redirect_to login_path
   rescue ActiveRecord::RecordInvalid
    flash.now[:error] = @user.errors.each_full {}.join('<br/>')
    render(:action => 'new')
  end
end
