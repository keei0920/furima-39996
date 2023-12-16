class CreateEndUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :end_users do |t|

      t.timestamps
    end
  end
end
