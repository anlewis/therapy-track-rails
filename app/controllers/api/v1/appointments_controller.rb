class Api::V1::AppointmentsController < ApplicationController
  def index
    render json: Appointment.all
  end

  def show
    render json: Appointment.find(params[:id])
  rescue
    render status: 404
  end
end