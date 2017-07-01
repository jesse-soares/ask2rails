class Authentication

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    user && user.authenticate(password)
  end
end