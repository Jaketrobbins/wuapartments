class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id
      t.integer :houseprice
      t.string :ptitle
      t.integer :psqft
      t.integer :pbed
      t.integer :pbath
      t.integer :pzip
      t.string :paddress
      t.string :pcity
      t.string :pstate	
      t.boolean :pfurnish
      t.boolean :pcats
      t.boolean :pdogs
      t.boolean :psmoke
      t.boolean :plaundry
      t.boolean :pparking

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end