defmodule <%= @module_name %>Web.LandingLive do
  use <%= @module_name %>Web, :live_view
  alias <%= @module_name %>.Waitlist
  import <%= @module_name %>Web.Components.{Hero, GradientBlob}

  def mount(_params, _session, socket) do
    form = Waitlist.changeset(%Waitlist{}, %{}) |> to_form()

    {:ok, assign(socket, form: form)}
  end

  def handle_event("register_interest", params, socket) do
    socket =
      case Waitlist.new(params) do
        {:ok, _} ->
          socket
          |> assign(form: Waitlist.changeset(%Waitlist{}, %{}) |> to_form())
          |> put_flash(:info, "Thank you for your interest!")

        {:error, changeset} ->
          assign(socket, form: changeset |> to_form())
      end

    {:noreply, socket}
  end
end
