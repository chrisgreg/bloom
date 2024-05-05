defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  use PhoenixStorybook.Story, :page

  def doc, do: "How to get started with Bloom"

  # Declare an optional tab-based navigation in your page:
  def navigation do
    [
      {:welcome, "Welcome", {:fa, "hand-wave", :thin}},
      {:components, "Components", {:fa, "toolbox", :thin}},
      {:sandboxing, "Sandboxing", {:fa, "box-check", :thin}},
      {:icons, "Icons", {:fa, "icons", :thin}}
    ]
  end

  # This is a dummy fonction that you should replace with your own HEEx content.
  def render(assigns = %{tab: :welcome}) do
    ~H"""
    <div class="psb-welcome-page">
      <p>
        Head over to the Github page for more information.
        <strong>
          <a href="https://github.com/chrisgreg/bloom" target="_blank">
            See github
          </a>
        </strong>
        for the full installation guide.
      </p>

      <h2>Motivation</h2>
        <p>
          I make a lot of Phoenix projects, and the biggest thing that makes me jealous of React and the JS ecosystem is the plethora of beautiful component libraries they can pick and choose from. Shadcn in particular has a lovely pattern of providing a CLI tool that lets you npx install components into your codebase so you can have a great starting point and edit from there.
        </p>
        <p>
          This is my attempt at bringing this to Phoenix and Elixir. If anything, I'll be using it for styling my future projects even easier. These components so far are a rough collection from components I have built and been inspired by online which have made it into my projects. I'll be adding a showcase soon.
        </p>

      <h2>Contribution</h2>
      <p>
      This is a very rough repository so contributions are welcome. New components, improving how it's managed, improving the tasks for installation and making them smarter. There's lots to do.
      </p>

      <h2>No JavaScript?</h2>
      <p>
        Not yet anyway. Nothing against JS, I love Svelte and have years of experience with React, I just want to not rely on it until it's really necessary. You can get pretty far these days with what the browser gives you (and LiveView.JS is an option too). So no, no Alpine until it's really required.
      </p>

      <div>
        <h2>Installation</h2>
        <p>Can be installed by adding bloom to your list of dependencies in mix.exs:</p>
        <pre><code>def deps do
        [
          {:bloom, "~> 0.0.7"}
        ]
      end</code></pre>
        <p>Relies on Phoenix being installed.</p>
        <h2>Installing components</h2>
        <p>
          All components can be installed by running the following mix command in your project root:
        </p>
        <pre><code>mix bloom.install &lt;component_name&gt;</code></pre>
        <p>
          Some components require Tailwind Config changes - refer to the component doc for more information.
        </p>
        <p>View all components by running:</p>
        <pre><code>mix bloom.install help</code></pre>
      </div>
    </div>
    """
  end

  def render(assigns = %{tab: guide}) when guide in ~w(components sandboxing icons)a do
    assigns =
      assign(assigns,
        guide: guide,
        guide_content: PhoenixStorybook.Guides.markup("#{guide}.md")
      )

    ~H"""
    <p class="md:psb-text-lg psb-leading-relaxed psb-text-slate-400 psb-w-full psb-text-left psb-mb-4 psb-mt-2 psb-italic">
      <a
        class="hover:text-indigo-700"
        href={"https://hexdocs.pm/phoenix_storybook/#{@guide}.html"}
        target="_blank"
      >
        This and other guides are also available on HexDocs.
      </a>
    </p>
    <div class="psb-welcome-page psb-border-t psb-border-gray-200 psb-pt-4">
      <%= Phoenix.HTML.raw(@guide_content) %>
    </div>
    """
  end

  defp description_list(assigns) do
    ~H"""
    <div class="psb-w-full md:psb-px-8">
      <div class="md:psb-border-t psb-border-gray-200 psb-px-4 psb-py-5 sm:psb-p-0 md:psb-my-6 psb-w-full">
        <dl class="sm:psb-divide-y sm:psb-divide-gray-200">
          <%= for {dt, link} <- @items do %>
            <div class="psb-py-4 sm:psb-grid sm:psb-grid-cols-3 sm:psb-gap-4 sm:psb-py-5 sm:psb-px-6 psb-max-w-full">
              <dt class="psb-text-base psb-font-medium psb-text-indigo-700">
                <%= dt %>
              </dt>
              <dd class="psb-mt-1 psb-text-base psb-text-slate-400 sm:psb-col-span-2 sm:psb-mt-0 psb-group psb-cursor-pointer psb-max-w-full">
                <a
                  class="group-hover:psb-text-indigo-700 psb-max-w-full psb-inline-block psb-truncate"
                  href={link}
                  target="_blank"
                >
                  <%= link %>
                </a>
              </dd>
            </div>
          <% end %>
        </dl>
      </div>
    </div>
    """
  end

  defp doc_link(page) do
    "https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.#{page}.html"
  end
end
