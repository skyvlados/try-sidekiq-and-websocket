Sequel.migration do
  up do
    create_table(:articles) do
      primary_key :id
      column :title, String, null: false
      column :body, String, null: false
    end
  end

  down do
    drop_table(:articles)
  end
end
