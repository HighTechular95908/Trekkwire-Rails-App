class AddDescriptionToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :description, :text
  end
end
