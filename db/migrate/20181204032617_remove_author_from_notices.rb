class RemoveAuthorFromNotices < ActiveRecord::Migration[5.2]
  def change
    remove_column :notices, :author
  end
end
