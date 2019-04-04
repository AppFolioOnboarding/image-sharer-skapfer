class MakeUrlNonNull < ActiveRecord::Migration[5.2]
  def change
    change_column(:imageurls, :url, :string, null: false)
  end
end
