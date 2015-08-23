class PostsController < ApplicationController

layout 'admin'
before_action :user_check

  def index
  	@post = Post.sort
  end

  def new
  	@post = Post.new({:name => "Nagłówek posta...", :position =>(Post.count + 1)})
    @counter = Post.count + 1
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:notice] = "Post dodany"
  		redirect_to(:action => 'index')
  	else
  	 @counter = Post.all.count + 1
  		render('new')
  	end
  end

  def edit
    @post = Post.find(params[:id])
    @counter = Post.all.count
  end

    def update
      @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
       flash[:notice] = "Post pomyślnie zmodyfikowany"
      redirect_to(:action=>'show', :id => @post.id)
    else
      @counter = Post.all.count
      render('edit')
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def delete
  
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    flash[:notice] = "Post pomyślnie usunięty"
    redirect_to(:action=>'index')
  end

  private

 def post_params
 	params.require(:post).permit(:name, :position, :text, :img, :file)
 end

end
