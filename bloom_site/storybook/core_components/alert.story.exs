defmodule Storybook.CoreComponents.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.Alert.alert/1

  def variations do
    [
      %Variation{
        id: :default,
      }
    ]
  end
end
