Sequel.migration do
  up do
    create_table(:comments) do
      primary_key :id
      foreign_key :article_id, :articles, null: false
      column :body, String, null: false
      column :commenter, String, null: false
    end
  end

  down do
    drop_table(:comments)
  end
end
