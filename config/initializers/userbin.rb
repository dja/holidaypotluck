Userbin.configure do |config|
  config.app_id = ENV["USERBIN_APP_ID"]
  config.api_secret = ENV["USERBIN_API_SECRET"]


  config.root_path = "/"
  config.protected_path = "/profile"

  # Save a local user when a user logs in with Userbin
  config.create_user = Proc.new { |profile|
    User.create! do |user|
      user.userbin_id = profile.id
      user.name       = profile.name
      user.first_name = profile.first_name
      user.last_name  = profile.last_name
      user.username   = profile.username
      user.email      = profile.email
      user.image      = profile.image
    end
  }

  config.find_user = Proc.new { |userbin_id|
    User.find_by_userbin_id(userbin_id)
  }
end