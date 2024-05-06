defmodule Bloom.Components.Hero do
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
      <div class="text-pretty text-center text-8xl font-bold">
        <h1><%= render_slot(@inner_block) %></h1>
      </div>
      <div class="text-pretty mt-6 flex justify-center text-center text-2xl font-medium">
        <%= render_slot(@subtitle) %>
      </div>
      <div class="mt-14 flex flex-row items-center justify-center gap-4">
        <%= render_slot(@actions) %>
      </div>
    </div>
    """
  end
end
