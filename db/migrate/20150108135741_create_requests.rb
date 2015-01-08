class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :traps_id
      t.string  :remote_ip
      t.string  :request_method
      t.string  :scheme
      t.text    :query_string
      t.text    :query_params
      t.text    :cookies

      t.timestamps
    end
  end
end
