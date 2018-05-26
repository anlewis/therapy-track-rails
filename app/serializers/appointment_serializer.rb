class AppointmentSerializer < ActiveModel::Serializer
  attributes :id,
             :summary,
             :location,
             :description,
             :start_time,
             :end_time
end
