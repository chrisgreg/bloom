defmodule BloomSiteWeb.Components.Badge do
  use Phoenix.Component

  @moduledoc """
  Badge component
  """

  attr(:variant, :string, doc: "Badge variant", default: "primary")

  attr(:class, :string, default: "", doc: "Class for badge")
  attr(:rest, :global)

  slot(:inner_block, required: true)

  def badge(assigns) do
    ~H"""
    <span
      class={[
        "text-xs font-medium me-2 px-2.5 py-1 rounded-lg relative",
        variant_class(@variant),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </span>
    """
  end

  defp variant_class("primary"), do: "bg-black text-gray-100"
  defp variant_class("secondary"), do: "bg-white border border-black"
end
