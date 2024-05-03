defmodule BloomSite.Storybook.BloomComponents.Badge do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.Badge.badge/1

  def variations do
    [
      %Variation{
        id: :primary,
        slots: ["Badge"]
      },
      %Variation{
        id: :secondary,
        attributes: %{
          variant: "secondary"
        },
        slots: ["Badge"]
      },
      %Variation{
        id: :glow,
        attributes: %{
          variant: "primary",
          from_color: "rose-700",
          to_color: "purple-800"
        },
        slots: ["Badge"]
      }
    ]
  end
end
