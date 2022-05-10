class ApplyToBlogs < ActiveRecord::Migration[6.1]
  def change
  	add_column :blogs, :apply, :boolean
  	add_column :blogs, :accept_reject, :boolean
  	
  end
end
