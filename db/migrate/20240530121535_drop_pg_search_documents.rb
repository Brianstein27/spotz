class DropPgSearchDocuments < ActiveRecord::Migration[7.1]
  def change
    drop_table :pg_search_documents
  end
end
