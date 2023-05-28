class AddTagIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :tag, foreign_key: true
  end
end
