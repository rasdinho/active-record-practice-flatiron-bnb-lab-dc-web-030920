class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |r|
      r.integer :guest_id
      r.integer :listing_id
      r.datetime :checkin_time
      r.datetime :checkout_time
    end
  end
end
