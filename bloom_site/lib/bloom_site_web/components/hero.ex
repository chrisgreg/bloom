defmodule BloomSiteWeb.Components.Hero do
  use Phoenix.Component

  @doc """
  Hero component
  """

  attr(:class, :string, default: "", doc: "CSS class for the hero component")
  slot(:inner_block, required: true, doc: "Main content block of the hero component")
  slot(:subtitle, required: false, doc: "Subtitle content block")
  slot(:announcement_badge, required: false, doc: "Annoucement badge content block")
  slot(:actions, required: false, doc: "Action buttons or links")

  def hero(assigns) do
    ~H"""
    <div class={["container mx-auto max-w-4xl py-12", @class]}>
      <div class="hidden sm:mb-8 sm:flex sm:justify-center">
        <div :if={@announcement_badge != []} class="relative rounded-full px-3 py-1 text-sm leading-6 text-gray-600 ring-1 ring-gray-900/10 hover:ring-gray-900/20">
          <%= render_slot(@announcement_badge) %>
        </div>
      </div>
      <div class="text-8xl text-center font-bold text-pretty tracking-tight text-gray-900">
        <h1><%= render_slot(@inner_block) %></h1>
      </div>
      <div class="mt-6 text-center text-2xl flex leading-8 text-gray-600 justify-center font-medium text-pretty">
        <%= render_slot(@subtitle) %>
      </div>
      <div class="mt-16 flex justify-center flex-row gap-x-6 items-center">
        <%= render_slot(@actions) %>
      </div>
    </div>
    """
  end
end
