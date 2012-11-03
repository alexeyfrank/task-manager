class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :description
      t.integer :author_id
      t.integer :performer_id
      t.string :state

      t.timestamps
    end

    add_index  :stories, :author_id
    add_index  :stories, :performer_id

  end
end
