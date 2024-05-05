defmodule Bloom.Components.SoundEffect do
  @moduledoc """
  A component to play sound effects in the user's browser
  triggered by Elixir events from the backend

  The component itself renders a button for disabling sound effects
  """
  use Phoenix.LiveComponent

  # The singleton id of the sound effect component
  @id "sound_effect"

  # The sound effect to play when toggling sound effects on
  @activate_sound "/audio/pop.mp3"

  # minimum time in milliseconds between sound effects
  @debounce_time 400

  def mount(params, _session, socket) do
    {:ok, assign(socket, disabled: Map.get(params, :disabled, false))}
  end

  @impl true
  def update(assigns, socket) do
    # Check if user sound effects are currently disabled, or a new assign is setting disabled
    is_disabled? = Map.get(socket.assigns, :disabled) || Map.get(assigns, :disabled, false)

    currently_playing? = Map.get(socket.assigns, :playing, false)

    socket =
      socket
      |> assign(assigns)
      |> then(fn socket ->
        should_play_sound? = not is_nil(Map.get(assigns, :play_sound))

        if should_play_sound? and not currently_playing? and not is_disabled? do
          # unset the playing lock after the debounce time
          send_update_after(__MODULE__, [id: @id, playing: false], @debounce_time)

          socket
          |> push_event("play_sound", %{sound: assigns[:play_sound]})
          |> assign(playing: true)
        else
          socket
        end
      end)

    {:ok, socket}
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
      <.speaker_icon :if={!Map.get(assigns, :inner_block) || @inner_block == []} disabled={@disabled} />
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
    assigns = assign(assigns, id: @id)

    ~H"""
    <.live_component id={@id} module={__MODULE__} disabled={@disabled} inner_block={@inner_block} />
    """
  end

  @impl true
  def handle_event("toggle-sound", _params, socket = %{assigns: %{disabled: true}}) do
    socket =
      socket
      |> assign(disabled: false)
      |> push_event("play_sound", %{sound: @activate_sound})

    {:noreply, socket}
  end

  @impl true
  def handle_event("toggle-sound", _params, socket) do
    {:noreply, assign(socket, disabled: true)}
  end

  @doc """
  Trigger a sound effect to be played
  """
  def play_sound(sound) do
    send_update(__MODULE__, id: @id, play_sound: sound)
  end

  attr(:disabled, :boolean, default: false)

  defp speaker_icon(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256" class="w-4 h-4">
      <rect width="256" height="256" fill="none" />
      <path d="M163.52,24.81a8,8,0,0,0-8.43.88L85.25,80H40A16,16,0,0,0,24,96v64a16,16,0,0,0,16,16H85.25l69.84,54.31A7.94,7.94,0,0,0,160,232a8,8,0,0,0,8-8V32A8,8,0,0,0,163.52,24.81Z" />
      <path
        :if={@disabled}
        d="M235.31,128l18.35-18.34a8,8,0,0,0-11.32-11.32L224,116.69,205.66,98.34a8,8,0,0,0-11.32,11.32L212.69,128l-18.35,18.34a8,8,0,0,0,11.32,11.32L224,139.31l18.34,18.35a8,8,0,0,0,11.32-11.32Z"
      />
    </svg>
    """
  end
end
