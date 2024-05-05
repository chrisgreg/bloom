defmodule BloomSite.Storybook.BloomComponents.SoundEffect do
  use PhoenixStorybook.Story, :live_component

  def component, do: BloomSiteWeb.Components.SoundEffect

  def container, do: :iframe

  def attributes, do: [%Attr{id: :disabled, type: :boolean, default: false}]

  def slots, do: [%Slot{id: :inner_block}]

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
      %Variation{
        id: :custom_icon,
        slots: [
          ~s|<h1>Custom Icon</h1>|
        ]
      }
    ]
  end
end
