class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :user_id, :integer
      t.column :content, :string
    end
  end
end
