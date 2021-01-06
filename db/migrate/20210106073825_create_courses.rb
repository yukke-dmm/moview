class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :course_image
      t.string :digest_movie_url
      t.string :title
      t.string :introduce
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
