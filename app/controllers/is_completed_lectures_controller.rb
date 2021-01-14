class IsCompletedLecturesController < ApplicationController
  def create
    lecture = Lecture.find(params[:lecture_id])
    is_completed_lecture = current_user.is_completed_lectures.new(lecture_id: lecture.id)
    is_completed_lecture.save
    redirect_to request.referrer
  end

  def destroy
    lecture = Lecture.find(params[:lecture_id])
    is_completed_lecture = current_user.is_completed_lectures.find_by(lecture_id: lecture.id)
    is_completed_lecture.destroy
    redirect_to request.referrer
  end
end
