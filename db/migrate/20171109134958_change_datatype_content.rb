class ChangeDatatypeContent < ActiveRecord::Migration
  def change
    change_column :contacts, :content, :text
  end
end
