class ChangeTopicId < ActiveRecord::Migration
  def change
    remove_column :resources, :list_id
    add_column :resources, :topic_id, :integer
  end
end
