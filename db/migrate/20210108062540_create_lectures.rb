class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :lecture_number
      t.string :title
      t.string :introduce
      t.text :lecture_movie_url
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
