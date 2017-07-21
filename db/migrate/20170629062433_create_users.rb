class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |tt|
      tt.string :name
      tt.string :email
      tt.timestamps
    end
  end
end
