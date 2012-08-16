# encoding: utf-8

randkey = SecureRandom.hex(24)

users = [
  {
    :first_name => 'System',
    :last_name => 'Root',
    :locality => 'Portland',
    :region => 'OR',
    :country => 'USA',
    :email => 'test@example.com', 
    :password => randkey, 
    :password_confirmation => randkey
  },
]

users.each {|u|
  user = User.create! u, :as => :root
}
