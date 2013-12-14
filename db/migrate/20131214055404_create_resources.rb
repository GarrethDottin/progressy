class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :content
      t.belongs_to :list
      t.timestamps
    end
  end
end
