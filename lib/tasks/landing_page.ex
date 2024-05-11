defmodule Mix.Tasks.Bloom.LandingPage do
  @moduledoc "Mix task to generate Landing Page with Ecto Waitlist for your application"
  use Mix.Task

  @doc """
  Run the mix task to generate the landing page.

  ## Examples

      iex> Mix.Tasks.Bloom.LandingPage.run([])
  """
  @impl true
  def run(args) do
    case args do
      ["help"] ->
        print_usage_and_components()

      _ ->
        install_landing_page()
    end
  end

  defp install_landing_page do
    env = Mix.env() |> Atom.to_string()
    project_name = Mix.Project.config()[:app] |> Atom.to_string() |> String.downcase()
    files_path = "_build/#{env}/lib/bloom/priv/templates/landing_page"
    module_name = project_name |> Macro.camelize()

    component_dir = component_dir(project_name)
    File.mkdir_p(component_dir)

    File.ls!(files_path)
    |> Enum.each(fn file ->
      source_file = "#{files_path}/#{file}"

      source_code =
        EEx.eval_file(source_file, module_name: module_name, assigns: %{module_name: module_name})

      target_path = "#{component_dir}/#{file}"
      File.write!(target_path, source_code)

      Mix.shell().info("Successfully generated #{target_path} ✅")
    end)

    Mix.shell().info(
      "Landing page generated - don't forget to run the migration specified in the waitlist.ex module and add the liveview to your router."
    )
  end

  defp print_usage_and_components do
    Mix.shell().info("Usage: mix bloom.landing_page - requires hero and gradient_blob components")
  end

  defp component_dir(app_name), do: "lib/#{app_name}_web/live" |> String.downcase()
end
