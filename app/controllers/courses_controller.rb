class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end


	def show
		@course = Course.find(params[:id])
		@sections = @course.sections.all
		@section = Section.find(params[:id])
	end

private

	def course_params
		params.require(:course).permit(:course_image, :digest_movie_url, :title, :introduce, :image)
	end

end
