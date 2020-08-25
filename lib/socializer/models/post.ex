defmodule Socializer.Models.Post do
  @moduledoc """
  Defines the Post model struct.
  """

  use Socializer.Model

  alias Socializer.{Comment, Repo, User}

  @required [
    :body,
    :user_id
  ]

  @optional []

  schema "posts" do
    field :body, :string

    belongs_to :user, User
    has_many :comments, Comment

    timestamps()
  end

  def all do
    Repo.all(from p in __MODULE__, order_by: [desc: p.id])
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> foreign_key_constraint(:user_id)
  end
end
