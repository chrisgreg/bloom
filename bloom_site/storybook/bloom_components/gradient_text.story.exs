defmodule BloomSite.Storybook.BloomComponents.GradientText do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.GradientText.gradient_text/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          class: "text-4xl font-bold"
        },
        slots: ["Default"]
      },
      %Variation{
        id: :custom_colors,
        attributes: %{
          class: "text-4xl font-bold",
          from_color: "pink-500",
          to_color: "cyan-500"
        },
        slots: ["Fancy heading"]
      }
    ]
  end
end
