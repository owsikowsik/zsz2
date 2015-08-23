class AccessController < ApplicationController

  layout "admin"

  before_action :user_check, :except => [:login, :logowanie, :logout]

  def index
  end

  def login
  end

  def logowanie

    if params[:user].present? && params[:password].present?
      user_check = User.where(:user => params[:user]).first
      if user_check
        user_authenticate = user_check.authenticate(params[:password]) 
      end
    end

    if user_authenticate
      session[:user_id] = user_authenticate.id
      session[:user] = user_authenticate.user
      flash[:notice] = "Cześć "+user_authenticate.name+"! Zostałeś poprawnie zalogowany."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "błąd: niepoprawna nazwa użytkownika lub hasło."
      redirect_to(:action => 'login')
    end

  end


  def logout
    session[:user_id] = nil
    session[:user] = nil
    flash[:notice] = "Zostałeś wylogowany"
    redirect_to(:action => "login")
  end


end