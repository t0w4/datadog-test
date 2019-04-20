class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string   :title
      t.string   :author
      t.string   :publisher
      t.text     :isbn
      t.datetime :publication_date
      t.text     :description
      t.timestamps
    end
  end
end
