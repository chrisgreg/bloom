defmodule BloomSite.Storybook.BloomComponents.Cards do
  use PhoenixStorybook.Story, :component

  # def function, do: &BloomSiteWeb.Components.Card.card/1
  def function, do: &BloomSiteWeb.Components.Marquee.marquee/1
  def imports, do: [{BloomSiteWeb.Components.Card, [card: 1]}]

  def template do
    """
    <.card image="https://picsum.photos/64" title="Title" subheading="@subheading" body="Just run mix bloom.install card" />
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Title",
          subheading: "Subheading",
          image: "http://hello.x.com",
        },
      }
    ]
  end
end
