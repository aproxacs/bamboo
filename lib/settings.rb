class Settings < Settingslogic
  source "#{Rails.root}/config/#{ENV['SETTING_FILENAME'] || "app_config.yml"}"
  namespace Rails.env
end
