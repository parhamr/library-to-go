class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, :null => false
      t.string :slug
      t.text :contents
      t.datetime :visible_at
      t.datetime :hidden_at
      t.string :state, :default => 'new', :null => false

      t.timestamps
    end
    add_index :pages, :state
    add_index :pages, [:visible_at, :hidden_at]
    add_index :pages, :slug
  end
end
