defmodule Bloom.Components.SoundEffect do
  @moduledoc """
  A component to play sound effects in the user's browser
  triggered by Elixir events from the backend

  The component itself renders a button for disabling sound effects
  """
  use Phoenix.LiveComponent

  def mount(params, _session, socket) do
    # subscribe to Phoenix PubSub events
    :ok = Phoenix.PubSub.subscribe(Bloom.PubSub, "sound_effect:play")
    {:ok, assign(socket, disabled: Map.get(params, :disabled, false))}
  end

  attr(:disabled, :boolean, default: false)
  slot(:inner_block, default: [])

  @impl true
  def render(assigns) do
    ~H"""
    <button
        id="sound-effect"
        phx-hook="soundEffectHook"
        phx-click="toggle-sound"
        phx-target={@myself}
        aria-label={"Turn sound effects #{if(@disabled, do: "on", else: "off")}"}
        class=""
      >
        <%!-- We render the default speaker_icon unless one is provided --%>
        <.speaker_icon disabled={@disabled} :if={!Map.get(assigns, :inner_block) || @inner_block == []} />
        <%= render_slot(@inner_block, %{disabled: @disabled}) %>
    </button>
    """
  end

  attr(:disabled, :boolean, default: false)
  slot(:inner_block)

  @doc """
  The sound effect component for playing sounds in the user's browser
  """
  def sound_effect(assigns) do
    ~H"""
    <.live_component module={__MODULE__} disabled={@disabled} inner_block={@inner_block} />
    """
  end

  @impl true
  def handle_event("toggle-sound", _params, socket) do
    {:noreply, assign(socket, disabled: !socket.assigns.disabled)}
  end

  def handle_info({:play_sound, sound}, %{assigns: %{disabled: false}} = socket) do
    IO.inspect("play sound event received")
    # inform the frontend that a sound needs to be played
    {:noreply, push_event(socket, "play_sound", %{sound: sound})}
  end

  def handle_info({:play_sound, _sound}, socket) do
    IO.inspect("play sound whilst disabled")
    {:noreply, socket}
  end

  def handle_info(event, socket) do
    IO.inspect("unhandled event #{inspect(event)}")
    {:noreply, socket}
  end

  @doc """
  Uses PubSub to trigger a sound effect to be played
  """
  def play_sound(sound) do
    Phoenix.PubSub.broadcast(Bloom.PubSub, "sound_effect:play", {:play_sound, sound})
  end

  attr(:disabled, :boolean, default: false)

  defp speaker_icon(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" class="w-4 h-4">
      <rect width="256" height="256" fill="none"/>
      <path d="M163.52,24.81a8,8,0,0,0-8.43.88L85.25,80H40A16,16,0,0,0,24,96v64a16,16,0,0,0,16,16H85.25l69.84,54.31A7.94,7.94,0,0,0,160,232a8,8,0,0,0,8-8V32A8,8,0,0,0,163.52,24.81Z"/>
      <path :if={@disabled} d="M235.31,128l18.35-18.34a8,8,0,0,0-11.32-11.32L224,116.69,205.66,98.34a8,8,0,0,0-11.32,11.32L212.69,128l-18.35,18.34a8,8,0,0,0,11.32,11.32L224,139.31l18.34,18.35a8,8,0,0,0,11.32-11.32Z"/>
    </svg>
    """
  end
end
