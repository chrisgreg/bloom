defmodule <%= @module_name %>Web.Components.Button do
  use Phoenix.Component

  @doc """
  An extension of the *core_components button*.
  The `<.button>` has the ability to handle a variant attribute.
  This makes it possible to have a `contained` or `outlined` look.

  ⚠️ Uninstall the core button component!
  As you do not need two button components, the button component of the core phoenix_package can be deleted.
  """

  attr(:type, :string, default: nil)
  attr(:class, :string, default: nil)
  attr(:rest, :global, include: ~w(disabled form name value))
  attr(:variant, :string, default: "contained")

  slot(:inner_block, required: true)

  def button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "rounded-lg px-3 py-2 box-sizing:border-box phx-submit-loading:opacity-75",
        "text-sm font-semibold leading-6 text-white active:text-white/80",
        get_variant(assigns.variant),
        @class
      ]}
      {@rest}
    >
      <%%= render_slot(@inner_block) %>
    </button>
    """
  end

  defp get_variant(variant) do
    case variant do
      "contained" ->
        "border-2 border-zinc-900 hover:border-zinc-700 bg-zinc-900 hover:bg-zinc-700"

      "outlined" ->
        "border-2 border-zinc-900 bg-transparent text-zinc-900 hover:bg-zinc-700 hover:border-zinc-700 hover:text-white active:bg-zinc-700"

      _ ->
        "bg-zinc-900 hover:bg-zinc-700"
    end
  end
end
