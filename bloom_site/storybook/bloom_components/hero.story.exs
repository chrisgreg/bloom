defmodule BloomSite.Storybook.BloomComponents.Hero do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.Hero.hero/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          "Hero"
        ]
      },
      %Variation{
        id: :with_subtitle,
        slots: [
          "Hero",
          ~s|<:subtitle>This is the subtitle</:subtitle>|
        ]
      },
      %Variation{
        id: :with_actions,
        slots: [
          "Hero",
          ~s|<:actions><button class="border px-4 py-1 bg-black text-white rounded text-lg" phx-click="go">Go</button></:actions>|
        ]
      },
      %Variation{
        id: :with_announcement_label,
        slots: [
          "Hero",
          ~s|<:announcement_badge>We just launched! <a class="text-blue-500" href="#">Read more here</a></:announcement_badge>|
        ]
      }
    ]
  end
end
