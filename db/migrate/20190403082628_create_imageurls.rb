# FIXME non-null
class CreateImageurls < ActiveRecord::Migration[5.2]
  def change
    create_table :imageurls do |t|
      t.string :url

      t.timestamps
    end
  end
end
