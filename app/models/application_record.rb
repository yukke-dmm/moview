class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


	def previous
		Lecture.where("id < ?", self.id).order("id DESC").first
	end

	def next
		Lecture.where("id > ?", self.id).order("id ASC").first
	end

end
