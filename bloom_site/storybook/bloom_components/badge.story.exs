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
      }
    ]
  end
end
