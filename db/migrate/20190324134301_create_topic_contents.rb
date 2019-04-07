class CreateTopicContents < ActiveRecord::Migration[5.0]
  def change
    create_table :topic_contents do |t|
      t.string :user_name
      t.text :content
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
