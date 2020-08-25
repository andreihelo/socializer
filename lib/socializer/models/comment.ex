defmodule Socializer.Models.Comment do
  @moduledoc """
  Defines the Comment model struct.
  """

  use Socializer.Model

  alias Socializer.{Post, User}

  @required [
    :body,
    :post_id,
    :user_id
  ]

  @optional []

  schema "comments" do
    field :body, :string

    belongs_to :post, Post
    belongs_to :user, User

    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> foreign_key_constraint(:post_id)
    |> foreign_key_constraint(:user_id)
  end
end
