class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |r|
      r.integer :guest_id
      r.integer :listing_id
      r.string :checkin
      r.string :checkout
      r.timestamps
    end
  end
end
