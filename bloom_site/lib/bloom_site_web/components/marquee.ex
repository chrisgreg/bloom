defmodule BloomSiteWeb.Components.Marquee do
  use Phoenix.Component

  @moduledoc """
  Marquee component

  Sliding carousel of images that can go backwards and forwards.

  Requires the following Tailwind CSS config extension:

  extend: {
      animation: {
        marquee: "marquee 20s linear infinite",
        "marquee-vertical": "marquee-vertical 20s linear infinite",
      },
      keyframes: {
        tilt: {
          "0%, 50%, 100%": { transform: "rotate(0deg)" },
          "25%": { transform: "rotate(6deg)" },
          "75%": { transform: "rotate(-6deg)" },
        },
        marquee: {
          from: { transform: "translateX(0)" },
          to: { transform: "translateX(calc(-100% - var(--gap)))" },
        },
        "marquee-vertical": {
          from: { transform: "translateY(0)" },
          to: { transform: "translateY(calc(-100% - var(--gap)))" },
        },
      },
    }
  """

  attr(:pause_on_hover, :boolean, default: false, doc: "Pause on hover")
  attr(:repeat, :integer, default: 4, doc: "Number of repeats")
  attr(:vertical, :boolean, default: false, doc: "Vertical")
  attr(:reverse, :boolean, default: false, doc: "Reverse")
  attr(:class, :string, default: "", doc: "CSS class for parent div")

  attr(:rest, :global)

  slot(:inner_block, required: true)

  def marquee(assigns) do
    assigns =
      assigns
      |> assign(:repeat, assigns[:repeat] || 4)
      |> assign(:vertical, assigns[:vertical] || false)
      |> assign(:pause_on_hover, assigns[:pause_on_hover] || false)
      |> assign(:reverse, assigns[:reverse] || false)

    ~H"""
    <div
      :if={@repeat > 0}
      class={[
        "group flex overflow-hidden p-2 [--duration:40s] [--gap:1rem] [gap:var(--gap)]",
        @vertical && "flex-col",
        !@vertical && "flex-row",
        @class
      ]}
      {@rest}
    >
      <%= for _ <- 0..(@repeat - 1) do %>
        <div
          class={[
            "flex shrink-0 justify-around [gap:var(--gap)]",
            @vertical && "flex-col animate-marquee-vertical",
            !@vertical && "flex-row animate-marquee",
            @pause_on_hover && "group-hover:[animation-play-state:paused]"
          ]}
          style={@reverse && "animation-direction: reverse;"}
        >
          <%= render_slot(@inner_block) %>
        </div>
      <% end %>
    </div>
    """
  end
end
