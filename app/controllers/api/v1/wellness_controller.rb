class Api::V1::WellnessController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    wellness_report = WellnessReport.create(wellness_params)
    report.wellness_report = wellness_report
    render json: wellness_report
  end

  private

    def wellness_params
      params.require(:wellness)
            .permit(:avg_sleep,
                    :avg_heartrate,
                    :weight,
                    :bmi,
                    :weight_change,
                    :avg_daily_exercise,
                   )
    end
end