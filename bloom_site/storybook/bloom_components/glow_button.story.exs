defmodule BloomSite.Storybook.BloomComponents.GlowButton do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.GlowButton.glow_button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Button"]
      },
      %Variation{
        id: :icy,
        attributes: %{
          from_color: "blue-600",
          to_color: "cyan-400",
          text_color: "white",
          background_color: "white"
        },
        slots: ["Components"]
      },
      %Variation{
        id: :custom_class,
        attributes: %{
          from_color: "emerald-600",
          to_color: "indigo-600",
          text_color: "orange-500"
        },
        slots: ["Ugly glow"]
      }
    ]
  end
end
