require 'rails_helper'

describe "Report API" do

  let!(:user) {create(:user)}

  before :each do
    sign_in user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "reports" do
    it "creates a report" do
      start_date = Time.zone.parse('2002-01-01 04:00:00 -0000')
      end_date = Time.zone.parse('2002-01-01 06:00:00 -0000')

      report_params = {
                        start_date: start_date,
                        end_date: end_date,
                      }

      post "/api/v1/reports", params: {report: report_params}

      report = Report.last

      expect(response).to be_success

      expect(report.status).to eq 0
      expect(report.start_date).to eq(report_params[:start_date])
      expect(report.end_date).to eq(report_params[:end_date])
    end
  end

  describe "basic reports" do
    it "creates a new basic report" do
      report = create(:report, user: user) 

      basic_params = {
                        oxygen: 92,
                        temperature: 98,
                        systolic: 120,
                        diastolic: 90,
                        notes: "some report notes"
                      }

      post "/api/v1/reports/#{report.id}/basic", params: {basic: basic_params}

      basic_report = BasicReport.last

      expect(response).to be_success

      expect(basic_report.report).to eq(report)
      expect(basic_report.oxygen).to eq(basic_params[:oxygen])
      expect(basic_report.temperature).to eq(basic_params[:temperature])
      expect(basic_report.systolic).to eq(basic_params[:systolic])
      expect(basic_report.diastolic).to eq(basic_params[:diastolic])
      expect(basic_report.notes).to eq(basic_params[:notes])
    end
  end
end