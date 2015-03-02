class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.belongs_to :album
      t.belongs_to :creator
      t.string :url

      t.timestamp
    end
  end
end
