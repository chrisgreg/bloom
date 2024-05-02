
defmodule <%= @module_name %>Web.Components.BloomButton do
  use Phoenix.Component

  @moduledoc """
  An extension of the *core_components button*.
  The `<.bloom_button>` has the possibility to handle variants
  in the form of `contained` or `outlined` buttons.

  ## Examples
  <.bloom_button>Send!</.button>
  <.bloom_button variant="outlined">Outlined Button</.button>
  """

  attr :type, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(disabled form name value)
  attr :variant, :string, default: "contained"

  slot :inner_block, required: true

  def bloom_button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "box-sizing:border-box phx-submit-loading:opacity-75 rounded-lg py-2 px-3",
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
      "contained" -> "border-2 border-zinc-900 hover:border-zinc-700 bg-zinc-900 hover:bg-zinc-700"
      "outlined" -> "border-2 border-zinc-900 bg-transparent hover:bg-zinc-700 hover:border-zinc-700 hover:text-white text-zinc-900"
      _ -> "bg-zinc-900 hover:bg-zinc-700"
    end
  end
end
