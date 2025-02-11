defmodule ElxGist.GistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElxGist.Gists` context.
  """

  @doc """
  Generate a gist.
  """
  def gist_fixture(attrs \\ %{}) do
    {:ok, gist} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markuo_text: "some markuo_text",
        name: "some name"
      })
      |> ElxGist.Gists.create_gist()

    gist
  end

  @doc """
  Generate a gist.
  """
  def gist_fixture(attrs \\ %{}) do
    {:ok, gist} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })
      |> ElxGist.Gists.create_gist()

    gist
  end

  @doc """
  Generate a saved_gist.
  """
  def saved_gist_fixture(attrs \\ %{}) do
    {:ok, saved_gist} =
      attrs
      |> Enum.into(%{

      })
      |> ElxGist.Gists.create_saved_gist()

    saved_gist
  end
end
