class ChangeColumnToImagesFilesFile < ActiveRecord::Migration[5.2]
  def change
  	rename_column :images, :files, :file
  end
end
