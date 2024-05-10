defmodule Bloom.Components.Avatar do
  use Phoenix.Component

  @moduledoc """
  Avatar component using https://avatars.dicebear.com styles.

  Can be overridden by an image URL.

  Styles available:
    Adventurer
    Adventurer Neutral
    Avataaars
    Avataaars Neutral
    Big Ears
    Big Ears Neutral
    Big Smile
    Bottts
    Bottts Neutral
    Croodles
    Croodles Neutral
    Fun Emoji
    Icons
    Identicon
    Initials
    Lorelei
    Lorelei Neutral
    Micah
    Miniavs
    Notionists
    Notionists Neutral
    Open Peeps
    Personas
    Pixel Art
    Pixel Art Neutral
    Rings
    Shapes
    Thumbs
  """

  attr(:name, :string, required: true, doc: "Name for avatar and seed for dicebear API")
  attr(:style, :string, default: "miniavs", doc: "Style for dicebear API")
  attr(:img_src, :string, required: false, doc: "Image URL - overrides dicebear API")
  attr(:class, :string, default: "", doc: "CSS class for parent div")
  attr(:rest, :global)

  def avatar(assigns) do
    image =
      assigns[:img_src] ||
        "https://api.dicebear.com/8.x/#{assigns[:style]}/svg?seed=#{assigns[:name]}"

    ~H"""
    <div class={["flex h-12 w-12 items-center", @class]} {@rest}>
      <img src={image} alt={"#{@name} avatar"} class="rounded-lg" />
    </div>
    """
  end
end
