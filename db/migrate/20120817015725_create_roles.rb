class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, :uniq => true, :null => false
      t.text :description

      t.timestamps
    end

    create_table :roles_users, :id => false do |t|
		  t.references :role, :user
		end
		add_index :roles_users, [:role_id, :user_id]
  end
end
