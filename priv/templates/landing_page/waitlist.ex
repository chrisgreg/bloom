defmodule <%= @module_name %>.Waitlist do
  use Ecto.Schema
  import Ecto.Changeset
  alias <%= @module_name %>.Repo

  schema "waitlist" do
    field :email, :string
    timestamps()
  end

  def changeset(waitlist, attrs) do
    waitlist
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must be a valid email")
    |> unique_constraint(:email, name: :waitlist_email_index)
  end

  def new(params) do
    changeset = %__MODULE__{} |> changeset(params)
    Repo.insert(changeset)
  end
end

# Create a migration with mix ecto.gen.migration add_waiting_list and add the following
# def change do
#   create table(:waitlist) do
#     add :email, :string, null: false
#     timestamps()
#   end

#   create unique_index(:waitlist, [:email])
# end
