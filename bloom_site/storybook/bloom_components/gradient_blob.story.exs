defmodule BloomSite.Storybook.BloomComponents.GradientBlob do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.GradientBlob.gradient_blob/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: []
      },
      %Variation{
        id: :with_seed,
        slots: [],
        attributes: %{
          seed: 10
        }
      }
    ]
  end
end
