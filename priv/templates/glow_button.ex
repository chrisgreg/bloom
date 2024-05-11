defmodule <%= @module_name %>Web.Components.GlowButton do
  use Phoenix.Component

  @doc """
  Glow button component

  Requires the following Tailwind CSS config extension:

  ...
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

  attr(:parent_class, :string, default: "", doc: "CSS class for parent div")
  attr(:class, :string, default: "", doc: "CSS class for button")

  attr(:from_color, :string, default: "purple-300")
  attr(:to_color, :string, default: "pink-300")

  attr(:text_color, :string, default: "gray-100")
  attr(:background_color, :string, default: "black")

  attr(:rest, :global)
  slot(:inner_block, required: true)

  def glow_button(assigns) do
    ~H"""
    <div class={["relative w-fit", @parent_class]} {@rest}>
      <div class={"from-#{@from_color} to-#{@to_color} animate-tilt absolute -inset-0.5 rounded-lg bg-gradient-to-r opacity-75 blur-lg transition duration-1000 group-hover:-inset-1 group-hover:opacity-100 group-hover:duration-200"}>
      </div>
      <button class={["relative rounded-lg bg-black px-7 py-4 leading-none", @class]}>
        <span class={"text-#{@text_color} font-medium transition-all duration-200 group-hover:text-#{@from_color}"}>
          <%%= render_slot(@inner_block) %>
        </span>
      </button>
    </div>
    """
  end
end
