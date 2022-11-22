class AddColumnToDownload < ActiveRecord::Migration[7.0]
  def change
    add_column :downloads, :name, :string
  end
end
