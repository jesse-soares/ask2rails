class AddPasswordDigestToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :password_digest, :text

    # fill new password column with encrypted password
    User.find_each do |user|
      user.update_column(
        :password_digest,
        BCrypt::Password.create(user.read_attribute(:password))
      )
    end

    change_column :users, :password_digest, :text, :null => false
  end

  def down
    remove_column :users, :password_digest
  end
end
