defmodule BloomSite.Storybook.BloomComponents.Accordion do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.Accordion.accordion/1

  # Make sure the width of the accordion is not too small
  def template do
    """
    <div class="w-full">
      <.psb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:header>
          What is Bloom?
          </:header>
          """,
          """
          <:panel>
          Bloom is an opinionated extension to Phoenix core_components.
          </:panel>
          """
        ]
      },
      %Variation{
        id: :with_color,
        slots: [
          """
          <:header color="red-500" hover_color="red-800" text_color="white" icon_color="white">
          How do I customize the colors?
          </:header>
          """,
          """
          <:panel>
          Use the colors attributes in the slots and pass them a color from the tailwind palette.
          </:panel>
          """
        ]
      }
    ]
  end

end
