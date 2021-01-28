unless User.find_by(email: 'admin@post.com').present?
  user = User.create(email: 'admin@post.com', password: 'post123')
  user.add_role :admin
end

unless User.find_by(email: 'user@post.com').present?
  user = User.create(email: 'user@post.com', password: 'post123')
  user.add_role :user
end
