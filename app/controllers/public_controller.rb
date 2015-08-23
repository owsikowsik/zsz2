class PublicController < ApplicationController
  
layout :resolve_layout
  
  def intro
  end

  def index

  end

  def about
  end

  def offer
  end 

  def blog
    @post = Post.order('position DESC')    
  end

  def gallery
    @zdjecia = Gallery.where(:type_id => 1).order('position DESC')

    @movies = Movie.sort
  end
  
  def photos
    @photo = Gallery.find(params[:gallery_id])
  end

  def contact

  end
  
  def contact_form
      name = params[:name]
      surname = params[:surname]
      email = params[:email]
      body = params[:comments]
      UserEmail.welcome_email(name, surname, email, body).deliver
  		flash[:notice] = "Wiadomość wysłano - Dziękujemy"
  		redirect_to(:action => 'contact')
  end
  
  
private

  def resolve_layout
    case action_name

    when "intro"
      'intro'
    else
      'public_front'
    end
  end
end
