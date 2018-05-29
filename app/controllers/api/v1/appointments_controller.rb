class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Appointment.all
  end

  def show
    render json: Appointment.find(params[:id])
  rescue
    render status: 404
  end

  def create
    render json: Appointment.create(appointment_params)
  rescue
    render status: 400
  end

  def update
    render json: Appointment.update(params[:id], appointment_params)
  rescue
    render status: 400
  end

  def destroy
    Appointment.find(params[:id]).destroy
      Appointment.delete(params[:id])
  rescue
    render status: 404
  end

  private

    def appointment_params
      params.require(:appointment).permit(:summary,
                                          :location,
                                          :description,
                                          :start_time,
                                          :end_time
                                         ).merge({user_id: current_user.id})
    end
end