defmodule BloomSiteWeb.ShowcaseLive do
  use BloomSiteWeb, :live_view
  import Phoenix.Component
  import BloomSiteWeb.Components.Hero
  import BloomSiteWeb.Components.GradientText

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <section>
        <.hero>
        <.gradient_text from_color="rose-400" to_color="purple-500">Showcase</.gradient_text>
          <:subtitle>
            Some Phoenix projects using Bloom components
          </:subtitle>
        </.hero>
      </section>

      <section>
        <div class="max-w-full mx-auto px-4 py-8">
          <div class="grid grid-cols-1 md:grid-cols-3 gap-12">
            <.showcase_entry image_url="/images/showcase/uini.png" url="https://uini.io?utm_source=bloom">
              <:name>Uini</:name>
              <:description>AI-powered user-research tool</:description>
            </.showcase_entry>
            <.showcase_entry image_url="/images/showcase/mealmind.png" url="https://mealmind.io?utm_source=bloom">
              <:name>mealmind</:name>
              <:description>AI-powered meal planning</:description>
            </.showcase_entry>
          </div>
        </div>
      </section>
    """
  end

  attr(:image_url, :string, required: true)
  slot(:name, required: true)
  slot(:description, required: true)
  defp showcase_entry(assigns) do
    ~H"""
      <div class="relative h-full">
        <a href={@url} target="_blank">
        <img class="rounded-lg object-cover w-full h-full" src={@image_url} />
        <div class="absolute bottom-0 bg-black/50 left-0 p-4 bg-gradient-to-t from-black to-transparent w-full">
          <h3 class="text-xl font-medium text-white">
            <%= render_slot(@name) %>
          </h3>
          <p class="text-neutral-400"><%= render_slot(@description) %></p>
        </div>
        </a>
      </div>
    """
  end
end
