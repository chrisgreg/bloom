defmodule BloomSite.Storybook.BloomComponents.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.Button.bloom_button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          "Button"
        ]
      },
      %Variation{
        id: :outlined,
        attributes: %{
          variant: "outlined"
        },
        slots: [
          "Outlined button"
        ]
      },
    ]
  end
end
