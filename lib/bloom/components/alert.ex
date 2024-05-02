defmodule Bloom.Components.Alert do
  use Phoenix.Component

  @moduledoc """
  Just a test component to see if the JS hooks setup works
  """

  def alert(assigns) do
    ~H"""
    <div phx-hook="alertOnMountHook" id="alert">Alert</div>
    """
  end
end
