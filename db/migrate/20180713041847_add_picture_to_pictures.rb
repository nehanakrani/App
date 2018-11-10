class AddPictureToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :picture, :string
  end
end
