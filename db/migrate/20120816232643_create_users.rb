class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :uniq => true, :null => false
      t.string :title
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :phone
      t.string :company
      t.string :address1
      t.string :address2
      t.string :locality
      t.string :region
      t.string :country
      t.string :postal_code
      t.string :time_zone
      t.date :birthday

      t.timestamps
    end
  end
end
