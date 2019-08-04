class UpdateColumnNameBalance < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :account, :balance
  end
end
