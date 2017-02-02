class AddPublishedToAdvertisement < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisements, :published, :boolean
  end
end
