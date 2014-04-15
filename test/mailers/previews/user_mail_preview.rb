def welcome
  UserMailer.welcome(User.last)
end
