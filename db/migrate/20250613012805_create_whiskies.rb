# frozen_string_literal: true

class CreateWhiskies < ActiveRecord::Migration[7.1]
  def change
    create_table :whiskies do |t|
      t.string :name
      t.string :genre
      t.string :country
      t.integer :status
      t.integer :rating
      t.text :comment
      t.date :drank_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
