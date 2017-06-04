defmodule EdExplorer.Web.OcticonHelpers do
  @moduledoc """
  Helper functions for displaying [Octicons](https://octicons.github.com).
  """

  use Phoenix.HTML

  alias EdExplorer.Octicons

  @type octicon_name :: String.t | atom

  @doc """
  Draws a normal-sized Octicon.
  """
  @spec octicon(octicon_name, map) :: Phoenix.HTML.safe
  def octicon(name, options \\ %{})

  def octicon(atom, options) when is_atom(atom), do: octicon(Atom.to_string(atom), options)

  def octicon(name, options) do
    raw(Octicons.toSVG(name, options))
  end

  @doc """
  Draws an upsized Octicon (32px tall).
  """
  @spec mega_octicon(octicon_name, map) :: Phoenix.HTML.safe
  def mega_octicon(name, options \\ %{})

  def mega_octicon(atom, options) when is_atom(atom), do: mega_octicon(Atom.to_string(atom), options)

  def mega_octicon(name, options) do
    new_opts = %{"height" => "32"}
               |> Map.merge(options)

    raw(Octicons.toSVG(name, new_opts))
  end
end
