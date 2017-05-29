class AddAttachmentPdfToTournaments < ActiveRecord::Migration
  def self.up
    change_table :tournaments do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :tournaments, :pdf
  end
end
