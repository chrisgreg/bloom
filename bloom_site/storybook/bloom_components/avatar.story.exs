defmodule BloomSite.Storybook.BloomComponents.Avatar do
  use PhoenixStorybook.Story, :example
  import BloomSiteWeb.Components.Avatar

  def function, do: &BloomSiteWeb.Components.Avatar.avatar/1
  def imports, do: [{BloomSiteWeb.Components.Avatar, [avatar: 1]}]

  @impl true
  def render(assigns) do
    ~H"""
      <p>Due to an issue with Phoenix Storybook - I cannot render a proper story for avatar components - see https://github.com/phenixdigital/phoenix_storybook/issues/205</p>

      <h2 class="my-12 font-semibold text-2xl">Dicebear Styles</h2>
      <div class="flex flex-row flex-wrap my-12 gap-4">
        <.avatar name="Alice" style="adventurer" />
        <.avatar name="Bob" style="adventurer-neutral" />
        <.avatar name="Charlie" style="avataaars" />
        <.avatar name="Diana" style="avataaars-neutral" />
        <.avatar name="Ethan" style="big-ears" />
        <.avatar name="Fiona" style="big-ears-neutral" />
        <.avatar name="George" style="big-smile" />
        <.avatar name="Hannah" style="bottts" />
        <.avatar name="Ian" style="bottts-neutral" />
        <.avatar name="Julia" style="croodles" />
        <.avatar name="Kevin" style="croodles-neutral" />
        <.avatar name="Liam" style="fun-emoji" />
        <.avatar name="Mia" style="icons" />
        <.avatar name="Noah" style="identicon" />
        <.avatar name="Olivia" style="initials" />
        <.avatar name="Parker" style="lorelei" />
        <.avatar name="Quinn" style="lorelei-neutral" />
        <.avatar name="Ruby" style="micah" />
        <.avatar name="Sam" style="miniavs" />
        <.avatar name="Tina" style="notionists" />
        <.avatar name="Umar" style="notionists-neutral" />
        <.avatar name="Violet" style="open-peeps" />
        <.avatar name="Will" style="personas" />
        <.avatar name="Xena" style="pixel-art" />
        <.avatar name="Yara" style="pixel-art-neutral" />
        <.avatar name="Zack" style="rings" />
        <.avatar name="Amelia" style="shapes" />
        <.avatar name="Ben" style="thumbs" />
      </div>

      <h2 class="my-12 font-semibold text-2xl">Supplied Image URL Style</h2>
      <div class="flex flex-row flex-wrap my-12 gap-4">
        <.avatar name="Ben" img_src="https://picsum.photos/64" />
      </div>
    """
  end


end
