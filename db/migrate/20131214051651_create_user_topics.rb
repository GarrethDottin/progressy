class CreateUserTopics < ActiveRecord::Migration
  def change
    create_table :user_topics do |t|
      t.belongs_to :user
      t.belongs_to :topic
      t.integer :rating
      t.timestamps
    end
  end
end
