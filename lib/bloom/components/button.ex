defmodule Bloom.Components.Button do
  use Phoenix.Component

  @moduledoc """
  Button component
  """

  attr(:class, :string, default: "", doc: "CSS class property for the button component")
  slot(:inner_block, required: true, doc: "Content block of the button component")

  def hero(assigns) do
    ~H"""
    <button>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end
end
