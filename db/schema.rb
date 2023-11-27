Sequel.migration do
  change do
    create_table(:articles) do
      primary_key :id
      column :title, "text", :null=>false
      column :body, "text", :null=>false
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:comments) do
      primary_key :id
      foreign_key :article_id, :articles, :null=>false, :key=>[:id]
      column :body, "text", :null=>false
      column :commenter, "text", :null=>false
    end
  end
end
              Sequel.migration do
                change do
                  self << "SET search_path TO \"$user\", public"
                  self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20231119121117_add_articles_table.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20231122084722_add_comments_table.rb')"
                end
              end
