class RenameThreadCategoryToTopicCategory < ActiveRecord::Migration[5.0]
  def change
    rename_table :thread_categories, :topic_categories
  end
end
