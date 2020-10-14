class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
   add_column :users, :name, :string
   add_column :users, :f_name_kanji, :string
   add_column :users, :l_name_kanji, :string
   add_column :users, :f_name_kana, :string
   add_column :users, :l_name_kana, :string
   add_column :users, :birthday, :date
  end
end
