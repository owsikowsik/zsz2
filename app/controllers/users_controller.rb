class UsersController < ApplicationController

layout 'admin'
before_action :user_check

  def index
  	@user = User.sortuj
  end

  def new
  	@user = User.new({:user => "Login..."})
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Użytkownik dodany"
  		redirect_to(:action => 'index')
  	else
  		render('new')
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

    def update
      @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:notice] = "Dane Użytkownika '#{@user.user}' pomyślnie zmodyfikowane"
      redirect_to(:action=>'index')
    else
      render('edit')
    end
  end

  def delete
  
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:notice] = "Konto Użytkownika '#{@user.user}' pomyślnie usunięte"
      redirect_to(:action=>'index')
  end

  private

 def user_params
 	params.require(:user).permit(:name, :surname, :user, :email, :password, :password_confirmation)
 end

end
