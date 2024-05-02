defmodule BloomSite.Storybook.BloomComponents.SoundEffect do
  use PhoenixStorybook.Story, :live_component

  def component, do: BloomSiteWeb.Components.SoundEffect

  def attributes, do: [%Attr{id: :disabled, type: :boolean, default: false}]

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          disabled: false
        },
      },
      %Variation{
        id: :disabled,
        attributes: %{
          disabled: true
        },
      },
    ]
  end
end
