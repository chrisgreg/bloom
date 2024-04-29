defmodule <%= @module_name %>Web.Components.Hero do
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
      <div class={["container mx-auto px-4 py-20", @class]}>
        <span class="text-4xl font-semibold">
          <%%= render_slot(@inner_block) %>
        </span>
        <div class="mt-10 flex justify-center">
          <%%= render_slot(@subtitle) %>
        </div>
        <div class="mt-10 flex justify-center">
          <%%= render_slot(@actions) %>
        </div>
      </div>
    """
  end
end
