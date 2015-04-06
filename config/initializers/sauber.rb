Sauber.configure do |config|
  config.blacklist = File.join(Rails.root, "config", "blacklist.yml")
  config.whitelist = []
  config.replacement = :stars
end