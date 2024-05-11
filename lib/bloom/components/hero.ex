defmodule Bloom.Components.Hero do
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
    <div class={["container mx-auto max-w-4xl py-32 sm:py-48 lg:py-56", @class]}>
      <div class="hidden sm:mb-8 sm:flex sm:justify-center">
        <div
          :if={@announcement_badge != []}
          class="ring-gray-900/10 relative rounded-full px-3 py-1 text-sm leading-6 text-gray-600 ring-1 hover:ring-gray-900/20"
        >
          <%= render_slot(@announcement_badge) %>
        </div>
      </div>
      <div class="text-pretty text-center text-6xl font-bold tracking-tight text-gray-900">
        <h1><%= render_slot(@inner_block) %></h1>
      </div>
      <div class="text-pretty mt-6 flex justify-center text-center text-lg font-medium leading-8 text-gray-600">
        <%= render_slot(@subtitle) %>
      </div>
      <div class="mt-6 flex flex-row items-center justify-center gap-x-6">
        <%= render_slot(@actions) %>
      </div>
    </div>
    """
  end
end
