class Api::V1::AppointmentsController < ApplicationController
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
  end

  private

    def appointment_params
      params.require(:appointment).permit(:summary,
                                          :location,
                                          :description,
                                          :start_time,
                                          :end_time
                                         )
    end
end