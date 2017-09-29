class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:comments) do |t|
      t.column(:name, :string)
      t.column(:email, :string)
      t.column(:comment, :string)

      t.timestamps
    end
  end
end
