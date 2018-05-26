require 'rails_helper'

describe "Calendar API" do
  it "sends a list of all appoinments" do
    appointment_1 = create(:appointment)
    appointment_2 = create(:appointment)

    get '/api/v1/appointments'

    appointments = JSON.parse(response.body)

    expect(response).to be_success
    expect(appointments.count).to eq 2
    expect(appointments[0]['id']).to eq appointment_1.id
    expect(appointments[1]['id']).to eq appointment_2.id

    appointment = appointments.first

    expect(appointment).to have_key "id"
    expect(appointment).to have_key "summary"
    expect(appointment).to have_key "location"
    expect(appointment).to have_key "description"
    expect(appointment).to have_key "start_time"
    expect(appointment).to have_key "end_time"

    expect(appointment).not_to have_key "created_at"
    expect(appointment).not_to have_key "updated_at"
  end

  it "can get a single appointment by id" do
    id = create(:appointment).id

    get "/api/v1/appointments/#{id}"

    appointment = JSON.parse(response.body)

    expect(response).to be_success
    expect(appointment["id"]).to eq(id)

    expect(appointment).to have_key "id"
    expect(appointment).to have_key "summary"
    expect(appointment).to have_key "location"
    expect(appointment).to have_key "description"
    expect(appointment).to have_key "start_time"
    expect(appointment).to have_key "end_time"

    expect(appointment).not_to have_key "created_at"
    expect(appointment).not_to have_key "updated_at"
  end

  it "show returns 404 if appointment with requested id does not exist" do
    get "/api/v1/appointments/1"

    expect(response.status).to eq 404
  end

  it "can create a new appoinement" do
    start_time = Time.zone.parse('2002-01-01 04:00:00 -0000')
    end_time = Time.zone.parse('2002-01-01 06:00:00 -0000')
    
    appointment_params = {
                          summary: "This is an appointment",
                          location: "Somewhere",
                          description: "Appointment details",
                          start_time: start_time,
                          end_time: end_time,
                         }

    post "/api/v1/appointments", params: {appointment: appointment_params}

    appointment = Appointment.last

    expect(response).to be_success

    expect(appointment.summary).to eq(appointment_params[:summary])
    expect(appointment.location).to eq(appointment_params[:location])
    expect(appointment.description).to eq(appointment_params[:description])
    expect(appointment.start_time).to eq(appointment_params[:start_time])
    expect(appointment.end_time).to eq(appointment_params[:end_time])
  end                            

  it "can update an existing appointment" do
    id = create(:appointment, summary: "Appointment").id
    previous_summary = Appointment.last.summary
    appointment_params = { summary: "Updated Appointment" }

    patch "/api/v1/appointments/#{id}", params: {appointment: appointment_params}

    appointment = Appointment.find(id)
    appointment.reload

    expect(response).to be_success
    expect(appointment.summary).to_not eq(previous_summary)
    expect(appointment.summary).to eq("Updated Appointment")
  end

  it "can destroy an appointment" do
    id = create(:appointment).id

    expect(Appointment.count).to eq(1)

    delete "/api/v1/appointments/#{id}"

    expect(response.status).to eq 204
    expect(Appointment.count).to eq(0)
    expect{Appointment.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "destroy returns 404 if appointment with requested id does not exist" do
    delete "/api/v1/appointments/1"

    expect(response.status).to eq 404
  end
end