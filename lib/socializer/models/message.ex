defmodule Socializer.Models.Message do
  @moduledoc """
  Defines the Message model struct.
  """

  use Socializer.Model

  alias Socializer.Models.{Conversation, ConversationUser, Repo, User}

  @required [
    :body,
    :conversation_id,
    :user_id
  ]

  @optional []

  schema "messages" do
    field :body, :string

    belongs_to :conversation, Conversation
    belongs_to :user, User

    timestamps()
  end

  def all_for_conversation(conversation) do
    Repo.all(
      from m in __MODULE__,
        where: m.conversation_id == ^conversation.id,
        order_by: [asc: m.id]
    )
  end

  def changeset(message, attrs) do
    message
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> validate_user_in_conversation(:user_id)
    |> foreign_key_constraint(:conversation_id)
    |> foreign_key_constraint(:user_id)
  end

  defp validate_user_in_conversation(changeset, field) do
    validate_change(changeset, field, fn _, user_id ->
      case ConversationUser.find_by(%{
             conversation_id: changeset.changes[:conversation_id],
             user_id: user_id
           }) do
        nil -> [{field, "is not in conversation"}]
        _ -> []
      end
    end)
  end
end
