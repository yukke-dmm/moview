class AddAdminIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :admin_id, :integer
  end
end
