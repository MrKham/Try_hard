class CreateMicroposts < ActiveRecord::Migration[5.0]
  def change
    create_table :microposts do |tt|
      tt.text :content
      tt.references :user, foreign_key: true

      tt.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
