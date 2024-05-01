defmodule BloomSiteWeb.Components.CodeSnippet do
  use Phoenix.Component

  @moduledoc """
  Code snippet component
  """

  attr(:parent_class, :string, default: "", doc: "CSS class for parent div")
  attr(:class, :string, default: "", doc: "CSS class for code snippet")

  attr(:background_color, :string, default: "zinc-800")
  attr(:text_color, :string, default: "stone-300")

  attr(:delimiter, :string, default: "$")

  attr(:rest, :global)

  slot(:inner_block, required: true)

  def code_snippet(assigns) do
    ~H"""
    <div
      class={[
        "w-fit min-w-[18rem] rounded-xl bg-#{@background_color} py-5 text-#{@text_color}",
        @parent_class
      ]}
      {@rest}
    >
      <div class="mb-4 block h-3 w-3 rounded-full opacity-30 shadow-[1.4em_0,2.8em_0,4.2em_0]"></div>
      <pre
        before={@delimiter}
        class={[
          "whitespace-normal px-8 mt-6 before:opacity-50 before:content-[attr(before)]",
          @class
        ]}
      >
        <%= render_slot(@inner_block) %>
      </pre>
    </div>
    """
  end
end
