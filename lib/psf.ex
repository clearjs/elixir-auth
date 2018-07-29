defmodule Psf do
  @moduledoc """
  Psf keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @gcloud_scope "https://www.googleapis.com/auth/pubsub"

  def authenticate() do
    {:ok, token} = Goth.Token.for_scope(@gcloud_scope)
    token
  end
end
