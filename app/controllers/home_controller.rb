class HomeController < ApplicationController
  def index
  	@blogs = Blog.all
  end
  def home
  	@blogs = Blog.all

  	
  end

  

     
end
