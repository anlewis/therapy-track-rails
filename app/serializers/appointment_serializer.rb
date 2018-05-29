class AppointmentSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :summary,
             :location,
             :description,
             :start_time,
             :end_time
end
