defmodule BloomSiteWeb.Components.GlowButton do
  use Phoenix.Component

  @doc """
  Glow button component

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

  attr(:parent_class, :string, default: "", doc: "CSS class for parent div")
  attr(:class, :string, default: "", doc: "CSS class for button")

  attr(:from_color, :string, default: "rose-700")
  attr(:to_color, :string, default: "purple-800")

  attr(:text_color, :string, default: "gray-100")
  attr(:background_color, :string, default: "black")

  attr(:rest, :global)
  slot(:inner_block, required: true)

  def glow_button(assigns) do
    ~H"""
    <div>
      <div class={["w-fit mx-auto relative group", @parent_class]} {@rest}>
        <div class={"group-hover:opacity-100 animate-tilt transition duration-1000 group-hover:duration-200 absolute blur-lg opacity-75 -inset-1.5 group-hover:-inset-2 bg-gradient-to-r from-#{@from_color} to-#{@to_color} rounded-lg"}>
        </div>
        <button class={[
          "relative px-7 py-4 phx-submit-loading:opacity-75 bg-black rounded-lg leading-none",
          @class
        ]}>
          <span class={"text-#{@text_color} font-medium group-hover:text-#{@from_color} transition-all duration-200"}>
            <%= render_slot(@inner_block) %>
          </span>
        </button>
      </div>
    </div>
    """
  end
end
