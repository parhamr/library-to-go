# encoding: utf-8

randkey = SecureRandom.hex(24)

['admin','member'].each do |name|
  role = Role.create!({:name => name}, :as => :root)
end

users = [
  {
    :first_name => 'System',
    :last_name => 'Root',
    :locality => 'Portland',
    :region => 'OR',
    :country => 'USA',
    :email => 'root@example.com', 
    :password => randkey, 
    :password_confirmation => randkey,
    :role_ids => Role.all.collect(&:id)
  },
  {
    :first_name => 'Former',
    :last_name => 'User',
    :email => 'deleted@example.com', 
    :password => randkey, 
    :password_confirmation => randkey,
  }
]

users.each do |u|
  user = User.create! u, :as => :root
end
