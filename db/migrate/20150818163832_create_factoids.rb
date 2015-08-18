class CreateFactoids < ActiveRecord::Migration
  def change
    create_table :factoids do |t|
      t.string :summary
      t.text :body
      t.text :note

      t.timestamps null: false
    end
  end
end
