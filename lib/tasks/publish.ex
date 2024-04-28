defmodule Mix.Tasks.Publish do
  use Mix.Task
  import Mix.Generator

  @shortdoc "Generates templates and then publishes the package to Hex"
  def run(_args) do
    # Ensure all apps are started
    Mix.Task.run("app.start")

    # Run the bloom.generate_templates task
    Mix.shell().info("Generating templates...")
    Mix.Task.run("bloom.generate_templates")

    # Now run the hex.publish task
    Mix.shell().info("Publishing to Hex...")
    Mix.Task.run("hex.publish")
  end
end
