class Api::V1::AnxietyController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    anxiety_report = AnxietyReport.create(anxiety_params)
    report.anxiety_report = anxiety_report
    render json: anxiety_report
  end

  private

    def anxiety_params
      params.require(:anxiety)
            .permit(:q1,
                    :q2,
                    :q3,
                    :q4,
                    :q5,
                    :q6,
                    :q7,
                    :difficulty_level,
                   )
    end
end