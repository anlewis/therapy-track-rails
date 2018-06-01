class Api::V1::BasicController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    basic_report = BasicReport.create(basic_params)
    report.basic_report = basic_report
    render json: basic_report
  end

  private

    def basic_params
      params.require(:basic)
            .permit(:oxygen,
                    :temperature,
                    :systolic,
                    :diastolic,
                    :notes
                   )
    end
end