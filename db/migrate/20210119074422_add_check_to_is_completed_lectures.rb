class AddCheckToIsCompletedLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :is_completed_lectures, :check, :boolean,default: false
  end
end
