class AddURlToImage < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :url, :string
  end
end
