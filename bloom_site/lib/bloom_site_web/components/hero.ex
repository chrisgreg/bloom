defmodule BloomSiteWeb.Components.Hero do
  use Phoenix.Component

  @moduledoc """
  Hero component
  """

  attr(:class, :string, default: "", doc: "CSS class for the hero component")
  slot(:inner_block, required: true, doc: "Main content block of the hero component")
  slot(:subtitle, required: false, doc: "Subtitle content block")
  slot(:actions, required: false, doc: "Action buttons or links")

  def hero(assigns) do
    ~H"""
    <div class={["container mx-auto px-4 py-8", @class]}>
      <div class="text-8xl text-center font-bold text-pretty">
        <h1><%= render_slot(@inner_block) %></h1>
      </div>
      <div class="mt-6 text-center text-2xl flex justify-center font-medium text-pretty">
        <%= render_slot(@subtitle) %>
      </div>
      <div class="mt-14 flex justify-center flex-row gap-4 items-center">
        <%= render_slot(@actions) %>
      </div>
    </div>
    """
  end
end
