defmodule Storybook.Examples.BloomComponentsLanding do
  use PhoenixStorybook.Story, :example
  import BloomSiteWeb.Components.CodeSnippet
  import BloomSiteWeb.Components.GlowButton
  import BloomSiteWeb.Components.Hero
  import BloomSiteWeb.Components.GradientText
  import BloomSiteWeb.Components.BentoGrid
  import BloomSiteWeb.Components.Avatar
  import BloomSiteWeb.CoreComponents

  def doc do
    "The landing page for Bloom. Some styles aren't exactly right yet because of Storybook."
  end

  defstruct [:id, :first_name, :last_name]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-4xl mx-auto">
      <.hero>
        <img src="/images/bloom.png" class="w-[160px] mx-auto" />
        <.gradient_text from_color="rose-400" to_color="purple-500">Bloom</.gradient_text>
        <:subtitle>
          The opinionated extension to Phoenix Core Components. Install each component using the command line in seconds.
        </:subtitle>
        <:actions>
          <.link href="/storybook">
            <.glow_button>
              Components
            </.glow_button>
          </.link>
        </:actions>
      </.hero>

      <div class="mx-auto flex justify-center my-12">
        <.code_snippet>
          mix bloom.install code_snippet
        </.code_snippet>
      </div>

      <div class="flex flex-row flex-wrap my-12">
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
      <.avatar name="Ben" img_src="https://picsum.photos/64" />
      </div>

      <.bento_grid class="grid-rows-4 grid-cols-3">
        <.bento_card
          name="Calendar Item"
          icon="hero-calendar"
          description="All the components in Bloom."
          row_start={1}
          row_end={3}
          col_start={1}
          col_end={2}
        >
          <.button class="border-white text-white font-medium text-xs items-center gap-2 flex flex-row">
            Here's a button <.icon name="hero-arrow-right" class="h-4 w-4" />
          </.button>
        </.bento_card>
        <.bento_card
          name="Bell Bento"
          icon="hero-bell"
          description="All the components in Bloom."
          row_start={1}
          row_end={1}
          col_start={2}
          col_end={4}
        >
          <.button class="border-white text-white font-semibold">
            Here's a button
          </.button>
        </.bento_card>
        <.bento_card
          name="Some sort of hat"
          icon="hero-academic-cap"
          description="All the components in Bloom."
          row_start={3}
          row_end={4}
          col_start={1}
          col_end={2}
        >
          <.button class="border-white text-white font-semibold">
            Here's a button
          </.button>
        </.bento_card>
        <.bento_card
          name="Cloud Infrastructure"
          icon="hero-cloud"
          description="All the components in Bloom."
          row_start={2}
          row_end={4}
          col_start={2}
          col_end={3}
        >
          <.button class="border-white text-white font-semibold">
            Here's a button
          </.button>
        </.bento_card>
        <.bento_card
          name="Tournament"
          icon="hero-trophy"
          description="All the components in Bloom."
          row_start={2}
          row_end={4}
          col_start={3}
          col_end={4}
        >
          <.button class="border-white text-white font-semibold">
            Here's a button
          </.button>
        </.bento_card>
      </.bento_grid>
    </div>
    """
  end
end
