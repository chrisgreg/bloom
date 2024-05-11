defmodule BloomSiteWeb.LandingPageLive do
  use BloomSiteWeb, :live_view
  import BloomSiteWeb.Components.{Hero, GradientBlob}

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
