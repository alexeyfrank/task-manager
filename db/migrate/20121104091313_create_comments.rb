class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :author_id
      t.integer :story_id

      t.timestamps
    end
  end
end
