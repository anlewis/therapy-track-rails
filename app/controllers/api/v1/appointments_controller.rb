class Api::V1::AppointmentsController < ApplicationController
  def index
    render json: Appointment.all
  end
end