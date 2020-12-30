class AddRecordUuidToActiveStorageAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :active_storage_attachments, :record_uuid, :uuid

    User.all.each do |user|
      if user.logo.attached?
        user.logo.update(record_uuid: user.id)
      end
    end

    Team.all.each do |team|
      if team.logo.attached?
        team.logo.update(record_uuid: team.id)
      end
    end
  end
end
