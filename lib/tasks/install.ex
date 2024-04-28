defmodule Mix.Tasks.Bloom.Install do
  @moduledoc "Mix task to install components from the Bloom library"
  use Mix.Task

  @impl true
  def run(args) do
    case args do
      ["glow_button"] ->
        install_component("glow_button")

      _ ->
        Mix.shell().info("Usage: mix bloom.install [component_name]")
        Mix.shell().info("Available components: glow_button")
    end
  end

  defp install_component(file_name) do
    project_name = Mix.Project.config()[:app] |> Atom.to_string() |> String.downcase()

    case retrieve_source_code(file_name) do
      {:ok, source_code} ->
        component_dir = component_dir(project_name)
        File.mkdir_p(component_dir)
        target_path = "#{component_dir}/#{file_name}.ex"

        module_name = project_name |> Macro.camelize()

        updated_source_code =
          Regex.replace(~r/Bloom\.Components/, source_code, "#{module_name}Web.Components")

        File.write!(target_path, updated_source_code)
        Mix.shell().info("#{file_name} component installed successfully.")

      {:error, reason} ->
        Mix.shell().info("Error: #{reason}")
    end
  end

  defp retrieve_source_code(file_name) do
    source_file = "lib/bloom/components/#{file_name}.ex"

    if File.exists?(source_file) do
      {:ok, File.read!(source_file)}
    else
      {:error, "Source file not found: #{source_file}"}
    end
  end

  defp component_dir(app_name), do: "lib/#{app_name}_web/components" |> String.downcase()
end
