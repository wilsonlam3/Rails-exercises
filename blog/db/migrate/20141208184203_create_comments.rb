class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, index: true   # auto add a column `article_id`

      t.timestamps
    end
  end
end
