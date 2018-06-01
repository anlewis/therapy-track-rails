class Api::V1::ReportsController < ApplicationController
  def create
    render json: Report.create(report_params)
  rescue
    render status: 400
  end

  private

    def report_params
      params.require(:report)
            .permit(:start_date, :end_date)
            .merge({user_id: current_user.id})
    end
end