class ChangeDatatypeTelNumberOfAddresses < ActiveRecord::Migration[7.0]
  def change
    change_column :addresses, :tel_number, :string
  end
end
