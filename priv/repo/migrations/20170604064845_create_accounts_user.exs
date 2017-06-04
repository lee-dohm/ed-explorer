defmodule EdExplorer.Repo.Migrations.CreateEdExplorer.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :avatar_url, :string
      add :github_id, :integer, null: false
      add :site_admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
