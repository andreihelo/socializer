defmodule Socializer.Models.ConversationUser do
  @moduledoc """
  Defines the ConversationUser model struct.
  """

  use Socializer.Model

  alias Socializer.{Conversation, User}

  @required [
    :conversation_id,
    :user_id
  ]

  @optional []

  schema "conversation_user" do
    belongs_to :conversation, Conversation
    belongs_to :user, User

    timestamps()
  end

  def changeset(conversation_user, attrs) do
    conversation_user
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> foreign_key_constraint(:conversation_id)
    |> foreign_key_constraint(:user_id)
    |> unique_constraint(:user_id, name: :conversation_users_conversation_id_user_id_index)
  end
end
