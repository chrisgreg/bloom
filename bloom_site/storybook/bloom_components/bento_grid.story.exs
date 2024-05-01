defmodule BloomSite.Storybook.BloomComponents.BentoGrid do
  use PhoenixStorybook.Story, :component

  def function, do: &BloomSiteWeb.Components.BentoGrid.bento_card/1
  def imports, do: [{BloomSiteWeb.Components.BentoGrid, [bento_grid: 1]}]

  def template do
    """
    <.bento_grid class="grid-rows-4 grid-cols-4">
      <.psb-variation-group/>
    </.bento_grid>
    """
  end

  def variations do
    [
      %Variation{
        id: :bento_card,
        attributes: %{
          name: "Card",
          description: "Card Description",
          icon: "hero-trophy",
          row_start: 1,
          row_end: 4,
          col_start: 1,
          col_end: 4
        },
        slots: ["Put anything you want here"]
      },
      %VariationGroup{
        id: :basic_inputs,
        variations:
          for attrs <- [
                %{id: :a, row_start: 1, row_end: 1, col_start: 1, col_end: 4, icon: "trophy"},
                %{
                  id: :b,
                  row_start: 2,
                  row_end: 5,
                  col_start: 1,
                  col_end: 3,
                  icon: "arrow-right"
                },
                %{
                  id: :c,
                  row_start: 2,
                  row_end: 3,
                  col_start: 3,
                  col_end: 4,
                  icon: "arrow-right"
                },
                %{
                  id: :d,
                  row_start: 3,
                  row_end: 5,
                  col_start: 3,
                  col_end: 5,
                  icon: "arrow-right"
                }
              ] do
            %Variation{
              id: attrs.id,
              attributes: %{
                name: "Card: #{attrs.id}",
                description: "Card Description",
                icon: "hero-#{attrs.icon}",
                row_start: attrs.row_start,
                row_end: attrs.row_end,
                col_start: attrs.col_start,
                col_end: attrs.col_end
              },
              slots: ["Any slot here"]
            }
          end
      }
    ]
  end
end
