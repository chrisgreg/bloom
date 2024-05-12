defmodule Storybook.Examples.LandingPageGenerator do
  use PhoenixStorybook.Story, :example
  import BloomSiteWeb.CoreComponents
  import BloomSiteWeb.Components.{Hero, GradientBlob}

  alias Phoenix.LiveView.JS

  def doc do
    "You can create a landing page for your site complete with an Ecto backed waitlist for your users by running `mix bloom.landing_page`."
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       form: nil
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="bg-transparent">
      <div class="relative isolate px-6 pt-14 lg:px-8">
        <.gradient_blob position="top" seed={6} offset="0" width={80} rotate={10} />
        <.hero>
          Some sort of really interesting hero title
          <:subtitle>
            Here's where you put something else to really make people realise the value of your product
          </:subtitle>
          <:announcement_badge>
            Announcing our next round of funding or something.
            <a href="#" class="font-semibold text-violet-500">
              <span class="absolute inset-0" aria-hidden="true"></span>Read more
              <span aria-hidden="true">&rarr;</span>
            </a>
          </:announcement_badge>
          <:actions>
            <div class="mt-10 flex items-center justify-center gap-x-6">
              <.form
                for={@form}
                phx-submit="register_interest"
                class="flex items-center justify-center  space-x-4 flex-row"
              >
                <input
                  type="email"
                  field={:email}
                  value=""
                  name="email"
                  placeholder="Enter your email"
                  required
                  class="w-72 rounded-md border-gray-300 shadow-sm focus:border-violet-600 focus:ring-violet-500 sm:text-sm !mt-0"
                />
                <button
                  type="submit"
                  class="rounded-md bg-violet-500 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-violet-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-violet-500"
                >
                  Join Waitlist
                </button>
              </.form>
            </div>
          </:actions>
        </.hero>
        <.gradient_blob position="bottom" seed={831} offset="33" width={80} rotate={-20} />
      </div>
    </div>
    """
  end

end
