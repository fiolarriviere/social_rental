class AddColumnsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :start_time, :time
    add_column :reservations, :finish_time, :time
  end
end
