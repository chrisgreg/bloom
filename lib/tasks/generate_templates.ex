defmodule Mix.Tasks.Bloom.GenerateTemplates do
  use Mix.Task

  @shortdoc "Generates EEx templates from Bloom component files."
  def run(_args) do
    components_path = "lib/bloom/components"
    js_hooks_path = "assets/js"
    templates_path = "priv/templates"

    File.ls!(components_path)
    |> Enum.each(fn file ->
      content = File.read!(Path.join(components_path, file))
      template_content = convert_to_template(content)
      target_file = Path.join(templates_path, "#{Path.rootname(file)}.ex")
      File.mkdir_p!(Path.dirname(target_file))
      File.write!(target_file, template_content)
      Mix.shell().info("Generated template: #{target_file}")
    end)

    # js hooks are let raw for now
    File.ls!(js_hooks_path)
    |> Enum.each(fn file ->
      content = File.read!(Path.join(js_hooks_path, file))
      target_file = Path.join(templates_path, "#{Path.rootname(file)}.js")
      File.mkdir_p!(Path.dirname(target_file))
      File.write!(target_file, content)
      Mix.shell().info("Generated js hook template: #{target_file}")
    end)
  end

  defp convert_to_template(content) do
    content = content |> escape_eex_expressions()
    content = Regex.replace(~r/Bloom.Components/, content, "<%= @module_name %>Web.Components")
    Regex.replace(~r/Bloom.PubSub/, content, "<%= @module_name %>.PubSub")
  end

  defp escape_eex_expressions(content) do
    content
    # Escape <%= to <%%=
    |> String.replace(~r/<%=/, "<%%=")
    # Escape <% (for logic like <% if %> etc.) to <%%
    |> String.replace(~r/<% /, "<%% ")
  end
end
