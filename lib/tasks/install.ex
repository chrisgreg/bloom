defmodule Mix.Tasks.Bloom.Install do
  @moduledoc "Mix task to install components from the Bloom library"
  use Mix.Task

  @doc """
  Run the mix task with the component name as an argument to install the component.

  ## Examples

      iex> Mix.Tasks.Bloom.Install.run(["component_name"])
      "component_name component installed successfully."

      iex> Mix.Tasks.Bloom.Install.run(["nonexistent_component"])
      "Component not found: nonexistent_component"
  """
  @impl true
  def run(args) do
    case args do
      ["help"] ->
        print_usage_and_components()

      [component_name] ->
        if component_exists?(component_name) do
          install_component(component_name)
        else
          Mix.shell().error("Component not found: #{component_name}")
          print_usage_and_components()
        end

      _ ->
        print_usage_and_components()
    end
  end

  def install_component(file_name) do
    env = Mix.env() |> Atom.to_string()
    project_name = Mix.Project.config()[:app] |> Atom.to_string() |> String.downcase()
    source_file = "_build/#{env}/lib/bloom/priv/templates/#{file_name}.ex"
    js_hook_file = "_build/#{env}/lib/bloom/priv/templates/#{file_name}.js"

    if File.exists?(source_file) do
      component_dir = component_dir(project_name)
      File.mkdir_p(component_dir)
      target_path = "#{component_dir}/#{file_name}.ex"

      module_name = project_name |> Macro.camelize()

      source_code =
        EEx.eval_file(source_file, module_name: module_name, assigns: %{module_name: module_name})

      File.write!(target_path, source_code)

      component_includes_js? = File.exists?(js_hook_file)

      if component_includes_js? do
        js_hook_dir = "assets/vendor/hooks"
        File.mkdir_p(js_hook_dir)
        js_hook_target_path = "#{js_hook_dir}/#{file_name}.js"
        File.cp!(js_hook_file, js_hook_target_path)
      end

      Mix.shell().info("#{file_name} component installed successfully ✅ - #{target_path}")

      Mix.shell().info(
        "Don't forget to import the component to your #{project_name |> Macro.underscore()}_web.ex` file."
      )

      if component_includes_js? do
        Mix.shell().info(
          "Make sure you import the JS hook in your `app.js` file and add it to the hooks of your Liveview Socket."
        )
      end
    else
      Mix.shell().info("Template not found: #{source_file}")
    end
  end

  defp component_dir(app_name), do: "lib/#{app_name}_web/components" |> String.downcase()

  defp print_usage_and_components do
    Mix.shell().info("Usage: mix bloom.install [component_name]")

    Mix.shell().info(
      "Available components: glow_button | code_snippet | hero | gradient_text | bento_grid | card | marquee"
    )
  end

  defp component_exists?(file_name) do
    env = Mix.env() |> Atom.to_string()
    source_file = "_build/#{env}/lib/bloom/priv/templates/#{file_name}.ex"
    File.exists?(source_file)
  end
end
