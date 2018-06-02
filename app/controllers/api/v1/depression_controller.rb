class Api::V1::DepressionController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    depression_report = DepressionReport.create(depression_params)
    report.depression_report = depression_report
    render json: depression_report
  end

  private

    def depression_params
      params.require(:depression)
            .permit(:q1,
                    :q2,
                    :q3,
                    :q4,
                    :q5,
                    :q6,
                    :q7,
                    :q8,
                    :q9,
                    :q10,
                    :q11,
                    :q12,
                    :q13,
                    :q14,
                    :q15,
                    :q16,
                    :q17,
                    :q18,
                    :q19,
                    :q20,
                    :q21,
                   )
    end
end