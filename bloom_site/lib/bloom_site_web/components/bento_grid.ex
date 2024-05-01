defmodule BloomSiteWeb.Components.BentoGrid do
  use Phoenix.Component

  @moduledoc """
  Bento grid component with bento cards.

  See `bento_card/1` for usage.

  Whitelist col_start, col_end, row_start, row_end.
  """

  attr(:class, :string, default: "", doc: "CSS class for parent div")
  slot(:inner_block, required: true)

  def bento_grid(assigns) do
    ~H"""
    <div class={["grid w-full auto-rows-[16rem] grid-cols-3 gap-4", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr(:name, :string, required: true)
  attr(:description, :string, required: true)
  attr(:icon, :string, default: "hero-trophy", doc: "Hero-icon name")

  attr(:col_start, :integer, default: 1)
  attr(:col_end, :integer, default: 3)
  attr(:row_start, :integer, default: 1)
  attr(:row_end, :integer, default: 1)

  attr(:class, :string, default: "", doc: "CSS class for parent div")

  slot(:background, required: false)
  slot(:inner_block, required: true)

  def bento_card(assigns) do
    ~H"""
    <div class={[
      "group relative row-span-#{@row_end - @row_start} col-span-#{@col_end - @col_start} row-start-#{@row_start} row-end-#{@row_end} col-start--#{@col_start} col-end-#{@col_end} flex flex-col justify-between overflow-hidden rounded-xl bg-white [box-shadow:0_0_0_1px_rgba(0,0,0,.03),0_2px_4px_rgba(0,0,0,.05),0_12px_24px_rgba(0,0,0,.05)] transform-gpu dark:bg-black dark:[border:1px_solid_rgba(255,255,255,.1)] dark:[box-shadow:0_-20px_80px_-20px_#ffffff1f_inset]",
      @class
    ]}>
      <div><%= render_slot(@background) %></div>
      <div class="pointer-events-none z-10 flex transform-gpu flex-col gap-1 p-6 transition-all duration-300 group-hover:-translate-y-10">
        <span class={[
          "h-12 w-12 origin-left transform-gpu text-neutral-700 transition-all duration-300 ease-in-out group-hover:scale-75",
          @icon
        ]} />
        <h3 class="text-xl font-semibold text-neutral-700 dark:text-neutral-300"><%= @name %></h3>
        <p class="max-w-lg text-neutral-400"><%= @description %></p>
      </div>
      <div class="absolute bottom-0 flex w-full translate-y-10 transform-gpu flex-row items-center p-4 opacity-0 transition-all duration-300 group-hover:translate-y-0 group-hover:opacity-100">
        <%= render_slot(@inner_block) %>
      </div>
      <div class="pointer-events-none absolute inset-0 transform-gpu transition-all duration-300 group-hover:bg-black/[.03] group-hover:dark:bg-neutral-800/10">
      </div>
    </div>
    """
  end
end
