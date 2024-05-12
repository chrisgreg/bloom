defmodule <%= @module_name %>Web.Components.GradientText do
  use Phoenix.Component

  @moduledoc """
  Gradient text component
  """

  attr(:class, :string, default: "", doc: "CSS class for text")

  attr(:from_color, :string, default: "zinc-500")
  attr(:to_color, :string, default: "black")

  attr(:rest, :global)
  slot(:inner_block, required: true)

  def gradient_text(assigns) do
    ~H"""
    <span
      class={[
        "from-#{@from_color} to-#{@to_color} bg-gradient-to-r bg-clip-text text-transparent",
        @class
      ]}
      {@rest}
    >
      <%%= render_slot(@inner_block) %>
    </span>
    """
  end
end
