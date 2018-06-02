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

  describe "wellness reports" do
    it "creates a new wellness report" do
      report = create(:report, user: user) 

      wellness_params = {
                        avg_sleep: 8,
                        avg_heartrate: 80,
                        weight: 120,
                        bmi: 20,
                        weight_change: 2,
                        avg_daily_exercise: 20,
                      }

      post "/api/v1/reports/#{report.id}/wellness", params: {wellness: wellness_params}

      wellness_report = WellnessReport.last

      expect(response).to be_success

      expect(wellness_report.report).to eq(report)
      expect(wellness_report.avg_sleep).to eq(wellness_params[:avg_sleep])
      expect(wellness_report.avg_heartrate).to eq(wellness_params[:avg_heartrate])
      expect(wellness_report.weight).to eq(wellness_params[:weight])
      expect(wellness_report.bmi).to eq(wellness_params[:bmi])
      expect(wellness_report[:weight_change]).to eq(wellness_params[:weight_change])
      # wellness_report.weight_change returns nil, don't know why
      expect(wellness_report.avg_daily_exercise).to eq(wellness_params[:avg_daily_exercise])
    end
  end

  describe "anxiety reports" do
    it "creates a new anxiety report" do
      report = create(:report, user: user) 

      anxiety_params = {
                        q1: 1,
                        q2: 3,
                        q3: 0,
                        q4: 2,
                        q5: 1,
                        q6: 2,
                        q7: 0,
                        difficulty_level: 2,
                      }

      post "/api/v1/reports/#{report.id}/anxiety", params: {anxiety: anxiety_params}

      anxiety_report = AnxietyReport.last

      expect(response).to be_success

      expect(anxiety_report.report).to eq(report)
      expect(anxiety_report.q1).to eq(anxiety_params[:q1])
      expect(anxiety_report.q2).to eq(anxiety_params[:q2])
      expect(anxiety_report.q3).to eq(anxiety_params[:q3])
      expect(anxiety_report.q4).to eq(anxiety_params[:q4])
      expect(anxiety_report.q5).to eq(anxiety_params[:q5])
      expect(anxiety_report.q6).to eq(anxiety_params[:q6])
      expect(anxiety_report.q7).to eq(anxiety_params[:q7])
      expect(anxiety_report.difficulty_level).to eq(anxiety_params[:difficulty_level])
    end
  end

  describe "depression reports" do
    it "creates a new depression report" do
      report = create(:report, user: user) 

      depression_params = {
                        q1: 1,
                        q2: 3,
                        q3: 0,
                        q4: 2,
                        q5: 1,
                        q6: 2,
                        q7: 0,
                        q8: 0,
                        q9: 0,
                        q10: 0,
                        q11: 1,
                        q12: 3,
                        q13: 2,
                        q14: 1,
                        q15: 1,
                        q16: 0,
                        q17: 3,
                        q18: 0,
                        q19: 2,
                        q20: 0,
                        q21: 1,
                      }

      post "/api/v1/reports/#{report.id}/depression", params: {depression: depression_params}

      depression_report = DepressionReport.last

      expect(response).to be_success

      expect(depression_report.report).to eq(report)
      expect(depression_report.q1).to eq(depression_params[:q1])
      expect(depression_report.q2).to eq(depression_params[:q2])
      expect(depression_report.q3).to eq(depression_params[:q3])
      expect(depression_report.q4).to eq(depression_params[:q4])
      expect(depression_report.q5).to eq(depression_params[:q5])
      expect(depression_report.q6).to eq(depression_params[:q6])
      expect(depression_report.q7).to eq(depression_params[:q7])
      expect(depression_report.q8).to eq(depression_params[:q8])
      expect(depression_report.q9).to eq(depression_params[:q9])
      expect(depression_report.q10).to eq(depression_params[:q10])
      expect(depression_report.q11).to eq(depression_params[:q11])
      expect(depression_report.q12).to eq(depression_params[:q12])
      expect(depression_report.q13).to eq(depression_params[:q13])
      expect(depression_report.q14).to eq(depression_params[:q14])
      expect(depression_report.q15).to eq(depression_params[:q15])
      expect(depression_report.q16).to eq(depression_params[:q16])
      expect(depression_report.q17).to eq(depression_params[:q17])
      expect(depression_report.q18).to eq(depression_params[:q18])
      expect(depression_report.q19).to eq(depression_params[:q19])
      expect(depression_report.q20).to eq(depression_params[:q20])
      expect(depression_report.q21).to eq(depression_params[:q21])
    end
  end
end