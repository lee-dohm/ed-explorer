defmodule EdExplorer.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias EdExplorer.Accounts.User

  @derive {Phoenix.Param, key: :name}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts_users" do
    field :avatar_url, :string
    field :github_id, :integer
    field :name, :string
    field :site_admin, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :avatar_url, :github_id, :site_admin])
    |> validate_required([:name, :avatar_url, :github_id, :site_admin])
  end
end
