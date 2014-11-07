class AddAlertMessageToNotificationTypes < ActiveRecord::Migration
  def change
    add_column :notification_types, :alert_message, :string
  end
end
