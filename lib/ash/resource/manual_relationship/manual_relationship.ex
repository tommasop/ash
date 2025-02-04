defmodule Ash.Resource.ManualRelationship do
  @moduledoc """
  A module to implement manual relationships.
  """

  @type context :: %{
          optional(:relationship) => Ash.Resource.Relationships.relationship(),
          optional(:query) => Ash.Query.t(),
          optional(:actor) => term,
          optional(:tenant) => term,
          optional(:authorize?) => boolean,
          optional(:api) => module,
          optional(any) => any
        }

  @callback load(
              list(Ash.Resource.record()),
              opts :: Keyword.t(),
              context :: context()
            ) ::
              {:ok, map} | {:error, term}

  defmacro __using__(_) do
    quote do
      @behaviour Ash.Resource.ManualRelationship
    end
  end
end
