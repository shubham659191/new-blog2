class BlogsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
    def index

      unless user_signed_in?
        @blogs = Blog.all.where(accept_reject: true)
      else
        @blogs = current_user.blogs  if (current_user.has_role? :user)
        @blogs = Blog.all  if (current_user.has_role? :admin)
      end
  end

    def show
      @blog = Blog.find(params[:id])
    end

    def new
    @blog = Blog.new
  end

  
  def edit
    @blog = Blog.find(params[:id])
  end

  
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end


  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

      def aplly_user
             
             
              @blog = Blog.find(params[:id])
              @blog.update(apply:true )
              #@blog = update(apply:true)
              @blog.save
              redirect_to root_path
      end
      def  accept_reject
             
             
              @blog = Blog.find(params[:id])
              if  @blog.accept_reject == false 
                  @blog.update(accept_reject:true)
              else 
                  @blog.accept_reject == false
                  @blog.update(accept_reject:false)
              end    

              
              @blog.save
              redirect_to root_path
               
        end




    
    def blog_params

      params.require(:blog).permit(:title, :description ,:accept_reject ,:apply )
    end

      
    
end
