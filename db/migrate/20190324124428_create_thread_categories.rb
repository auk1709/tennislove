class CreateThreadCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :thread_categories do |t|
      t.string :name
      t.string :sort

      t.timestamps
    end
  end
end
