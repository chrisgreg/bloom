defmodule Bloom.Components.SoundEffect do
  @moduledoc """
  A component to play sound effects in the user's browser
  triggered by Elixir events from the backend

  The component itself renders a button for disabling sound effects
  """
  use Phoenix.LiveComponent

  attr(:disabled, :boolean, default: false)

  @impl true
  def mount(params, _session, socket) do
    # subscribe to Phoenix PubSub events
    Phoenix.PubSub.subscribe(Bloom.PubSub, "sound_effect:play")
    {:ok, assign(socket, disabled: Map.get(params, :disabled))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div phx-hook="soundEffectHook" id="sound-effect">
      <button
        phx-click="toggle-sound"
        phx-target={@myself}
        aria-label={"Turn sound effects #{if(@disabled, do: "on", else: "off")}"}
        class=""
      >
        <%!-- TODO: SVG icon of a speaker --%>
      </button>
    </div>
    """
  end

  attr(:disabled, :boolean, default: false)

  @doc """
  The sound effect component for playing sounds in the user's browser
  """
  def sound_effect(assigns) do
    ~H"""
    <.live_component module={__MODULE__} disabled={@disabled} />
    """
  end

  @impl true
  def handle_event("toggle-sound", _params, socket) do
    {:noreply, assign(socket, disabled: !socket.assigns.disabled)}
  end

  @impl true
  def handle_info({:play_sound, sound}, %{assigns: %{disabled: false}} = socket) do
    # inform the frontend that a sound needs to be played
    {:noreply, push_event(socket, "play_sound", %{sound: sound})}
  end

  @impl true
  def handle_info({:play_sound, _sound}, socket) do
    {:noreply, socket}
  end

  @doc """
  Uses PubSub to trigger a sound effect to be played
  """
  def play_sound(sound) do
    Phoenix.PubSub.broadcast(Bloom.PubSub, "sound_effect:play", {:play_sound, sound})
  end
end
