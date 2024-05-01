defmodule BloomSiteWeb.Components.Card do
  use Phoenix.Component

  @moduledoc """
  Card component
  """

  attr(:title, :string, doc: "Card title")
  attr(:subheading, :string, doc: "Card subheading")
  attr(:body, :string, doc: "Card body")
  attr(:image, :string, doc: "Card image", required: false)

  attr(:class, :string, default: "", doc: "CSS class for card")
  attr(:rest, :global)

  def card(assigns) do
    ~H"""
    <figure class={[
      "relative w-64 cursor-pointer overflow-hidden rounded-xl border transition-all p-4",
      "border-gray-200 bg-neutral-50-50 hover:bg-neutral-100 text-zinc-500",
      "dark:border-gray-50 dark:bg-gray-50 dark:hover:bg-gray-50",
      @class
    ]} {@rest}>
      <div class="flex flex-row items-center gap-2">
        <img :if={assigns[:image]} class="rounded-full" width="32" height="32" alt="" src={@image} />
        <div class="flex flex-col">
          <figcaption class="text-sm font-medium dark:text-white">
            <%= @title %>
          </figcaption>
          <p class="text-xs font-medium dark:text-white"><%= @subheading %></p>
        </div>
      </div>
      <blockquote class="mt-2 text-sm"><%= @body %></blockquote>
    </figure>
    """
  end
end
