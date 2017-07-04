require "digest/md5"

class Gravatar
  def self.url(email)
    email_hash = Digest::MD5.hexdigest(email)
    "http://gravatar.com/avatar/#{email_hash}?d=mm&s=100"
  end
end