defmodule BloomSiteWeb.Components.Badge do
  use Phoenix.Component

  @moduledoc """
  Badge component

  Requires the following Tailwind CSS config extension:

  extend: {
      animation: {
        tilt: "tilt 5s ease-in-out infinite",
      },
      keyframes: {
        tilt: {
          "0%, 50%, 100%": { transform: "rotate(0deg)" },
          "25%": { transform: "rotate(3deg)" },
          "75%": { transform: "rotate(-3deg)" },
        },
      },
  }
  """

  attr(:variant, :string, doc: "Badge variant", default: "primary")

  attr(:from_color, :string)
  attr(:to_color, :string)

  attr(:class, :string, default: "", doc: "Class for badge")
  attr(:rest, :global)

  slot(:inner_block, required: true)

  def badge(assigns) do
    ~H"""
    <div class={["w-fit mx-auto relative group"]} {@rest}>
      <div class={bg_gradient_class(assigns)}>
      </div>
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
    </div>
    """
  end

  defp variant_class("primary"), do: "bg-black text-gray-100"
  defp variant_class("secondary"), do: "bg-white border border-black"

  defp bg_gradient_class(%{from_color: from_color, to_color: to_color}),
    do:
      "group-hover:opacity-100 animate-tilt transition duration-75 group-hover:duration-200 absolute blur-lg opacity-100 -inset-1.5 group-hover:-inset-2 rounded-lg bg-gradient-to-r from-#{from_color} to-#{to_color}"

  defp bg_gradient_class(_assigns), do: ""
end
