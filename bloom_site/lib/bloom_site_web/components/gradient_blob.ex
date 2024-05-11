defmodule BloomSiteWeb.Components.GradientBlob do
  use Phoenix.Component

  @doc """
  Renders a gradient blob component with a randomly generated polygon shape.

  ## Assigns

  - `position`: The position of the blob. Can be either "top" or "bottom". Default is "top".
  - `offset`: The offset of the blob from the top or bottom edge in rem units. Default is 0.
  - `width`: The width of the blob in rem units. Default is 36.
  - `rotate`: The rotation of the blob in degrees. Default is 0.
  - `from_color`: The starting color of the gradient. Default is "#ff80b5".
  - `to_color`: The ending color of the gradient. Default is "#9089fc".
  - `seed`: A seed value used to generate the random polygon shape. Default is 0.
  """
  attr :position, :string, default: "top"
  attr :offset, :integer, default: 0
  attr :width, :integer, default: 36
  attr :rotate, :integer, default: 0
  attr :from_color, :string, default: "#ff80b5"
  attr :to_color, :string, default: "#9089fc"
  attr :seed, :integer, default: 0

  def gradient_blob(assigns) do
    position_style = get_position_style(assigns.position, assigns.offset)
    width_style = "width: #{assigns.width}rem;"
    rotate_style = "rotate: #{assigns.rotate}deg;"
    polygon = generate_polygon(assigns.seed)

    ~H"""
    <div class="pointer-events-none absolute left-0 right-0 -z-50 transform translate-z-0 overflow-hidden blur-2xl max-w-full" style={"#{position_style} #{width_style}"} aria-hidden="true">
      <div class="relative left-1/2 aspect-[1155/678] -translate-x-1/2 opacity-30" style={"background-image: linear-gradient(to top right, #{@from_color}, #{@to_color}); clip-path: polygon(#{polygon}); #{rotate_style}"}>
      </div>
    </div>
    """
  end

  defp get_position_style("top", offset), do: "top: -#{offset}rem;"
  defp get_position_style("bottom", offset), do: "bottom: -#{offset}rem;"

  defp generate_polygon(seed) do
    :rand.seed(:exsss, {seed, seed, seed})
    num_points = Enum.random(5..10)
    points =
      for _ <- 1..num_points do
        x = :rand.uniform() * 100
        y = :rand.uniform() * 100
        "#{x}% #{y}%"
      end
    Enum.join(points, ", ")
  end
end
