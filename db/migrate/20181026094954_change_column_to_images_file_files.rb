class ChangeColumnToImagesFileFiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :file, :files
  end
end
