# encoding: utf-8

randkey = SecureRandom.hex(24)

roles = [
  {
    :name => 'admin',
    :description => 'Admins are granted the ability to manage almost all record types.',
  },
  {
    :name => 'staff',
    :description => 'Staff are users with basic elevated privileges.'
  },
  {
    :name => 'member',
    :description => 'Members are standard users.'
  }
]
roles.each do |r|
  role = Role.create!(r, :as => :root)
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
