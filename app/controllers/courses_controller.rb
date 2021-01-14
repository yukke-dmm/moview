class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def show
		@course = Course.find(params[:id])
		@sections = @course.sections.all
		@section = Section.find(params[:id])
	end

	def create
	  @course = Course.new(course_params)
	  @course.user_id = current_user.id
	  if @course.save
	  	flash[:success] = "登録に成功しました"
	  	redirect_to courses_url
	  else
	  	render 'new'
	  end
	end

	def edit
    	@course = Course.find(params[:id])
    end

    def update
      @course = Course.find(params[:id])
      if @course.update_attributes(course_params)
        flash[:success] = "更新に成功しました"
        redirect_to @course
      else
        render 'edit'
      end
    end

    def destroy
      Course.find(params[:id]).destroy
      flash[:success] = "削除しました"
      redirect_to courses_url
    end

private

	def course_params
		params.require(:course).permit(:course_image, :digest_movie_url, :title, :introduce, :image)
	end

end
