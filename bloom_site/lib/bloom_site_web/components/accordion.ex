defmodule BloomSiteWeb.Components.Accordion do
  use Phoenix.Component

  @moduledoc """
  Accordion component.

  ## Examples

    <.accordion id="my-accordion">
      <:header>
        Open me!
      </:header>
      <:panel>
        I'm open!
      </:panel>
    </.accordion>
  """
  alias Phoenix.LiveView.JS

  slot :header, required: true do
    attr(:color, :string)
    attr(:hover_color, :string)
    attr(:text_color, :string)
    attr(:icon_color, :string)
  end

  slot :panel, required: true do
    attr(:color, :string)
    attr(:text_color, :string)
  end

  attr(:id, :string, required: true, doc: "A unique id to identify the accordion")

  attr(:open, :boolean,
    default: false,
    doc: "Whether the accordion should appear open or not."
  )

  def accordion(assigns) do
    ~H"""
    <div id={@id} class="relative overflow-hidden rounded-lg border border-gray-200">
      <button
        :for={header <- @header}
        id={"#{@id}-header"}
        aria-expanded={@open}
        aria-controls={"#{@id}-content"}
        class={[
          "flex w-full cursor-pointer items-center justify-between px-4 py-3 text-left transition-colors duration-200 ease-in-out focus:outline-none",
          "bg-#{Map.get(header, :color, "gray-100")}",
          "hover:bg-#{Map.get(header, :hover_color, "gray-200")}",
          "text-#{Map.get(header, :text_color, "gray-800")}"
        ]}
        phx-click={toggle(@id)}
      >
        <span class="font-medium"><%= render_slot(header) %></span>
        <span
          id={"#{@id}-icon"}
          aria-hidden="true"
          class={[
            "#{if @open, do: "hero-chevron-up", else: "hero-chevron-down"}",
            "h-5 w-5 cursor-pointer",
            "text-#{Map.get(header, :icon_color, "gray-500")}"
          ]}
        />
      </button>
      <div
        :for={panel <- @panel}
        id={"#{@id}-content"}
        role="region"
        aria-hidden={!@open}
        aria-labelledby={"#{@id}-header"}
        class={[
          "#{if @open, do: "block", else: "hidden"}",
          "hero-#{if @open, do: "block", else: "hidden"}",
          "px-4 py-3",
          "bg-#{Map.get(panel, :color, "white")}",
          "text-#{Map.get(panel, :text_color, "gray-800")}"
        ]}
      >
        <%= render_slot(panel) %>
      </div>
    </div>
    """
  end

  @doc """
  Toogles the accordion panel, opening or closing it.
  Also handles changing icons for each state.
  """
  def toggle(js \\ %JS{}, id) do
    js
    |> JS.toggle(
      to: "##{id}-content",
      in:
        {"transition-all transform ease-out duration-300",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
         "opacity-100 translate-y-0 sm:scale-100"},
      out:
        {"transition-all transform ease-in duration-200",
         "opacity-100 translate-y-0 sm:scale-100",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
    )
    |> JS.toggle_class("rotate-180", to: "##{id}-icon")
    |> JS.toggle_attribute({"aria-expanded", "true", "false"}, to: "##{id}-header")
  end
end
