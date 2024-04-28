defmodule Mix.Tasks.Bloom.Install do
  @moduledoc "Mix task to install components from the Bloom library"
  use Mix.Task

  @impl true
  def run(args) do
    case args do
      ["glow_button"] ->
        install_glow_button()

      _ ->
        Mix.shell().info("Usage: mix bloom.install [component_name]")
        Mix.shell().info("Available components: glow_button")
    end
  end

  defp component_dir(app_name), do: "lib/#{app_name}_web/components"

  defp create_component_dir(app_name) do
    component_dir(app_name)
    |> File.mkdir_p()
  end

  defp install_glow_button do
    project_name = Mix.Project.config()[:app] |> Atom.to_string()

    file_content = """
    defmodule #{project_name}.Components.GlowButton do
      use Phoenix.Component

      attr(:parent_class, :string, default: "", doc: "CSS class for parent div")
      attr(:class, :string, default: "", doc: "CSS class for button")

      attr(:from_color, :string, default: "lime")
      attr(:to_color, :string, default: "emerald")

      attr(:text_color, :string, default: "gray")
      attr(:background_color, :string, default: "black")

      attr(:rest, :global)
      slot(:inner_block, required: true)

      def glow_button(assigns) do
        ~H\\"\\"\"
          <div>
            <div class={["w-fit mx-auto relative", @parent_class]} {@rest}>
              <div class="group-hover:opacity-100 animate-tilt transition duration-1000 group-hover:duration-200 absolute blur-lg opacity-75 -inset-0.5 group-hover:-inset-1 bg-gradient-to-r from-lime-300 to-emerald-300 rounded-lg"></div>
              <button class={["relative px-7 py-4 bg-black rounded-lg leading-none", @class]}>
                <span class="text-gray-100 font-medium group-hover:text-lime-300 transition-all duration-200">
                  <%= render_slot(@inner_block) %>
                </span>
              </button>
            </div>
          </div>
        \\"\\"\\"
      end
    end
    """

    create_component_dir(project_name)
    File.write!("lib/#{project_name}_web/components/glow_button.ex", file_content)
    Mix.shell().info("GlowButton component installed successfully.")
  end
end
