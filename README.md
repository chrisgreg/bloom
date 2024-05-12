<p align="center">
  <img src="https://github.com/chrisgreg/bloom/raw/main/priv/images/bloom.png" width="256" alt="Bloom Logo" />

  <h1 align="center">Bloom</h1>

<p align="center">
  <img src="https://img.shields.io/hexpm/dt/bloom" alt="Hex.pm Downloads" />
  <img src="https://img.shields.io/hexpm/v/bloom" alt="Hex.pm Version" />
  <img src="https://img.shields.io/hexpm/l/bloom" alt="Hex.pm License" />
</p>

The opinionated extension to Phoenix core_components, inspired by [shadcn](https://ui.shadcn.com).

A set of HEEX components that can be independently installed and edited to your hearts content.

Working both with Live and dead controller views, written in HEEX using TailwindCSS and designed to be bolted onto applications using Phoenix Core Components.

</p>

## Demo

Visit [the demo](https://bloom-ui.fly.dev/) site to see a Phoenix Storybook of Bloom components.

## Installation

Can be installed by adding `bloom` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bloom, "~> 0.0.8"}
  ]
end
```

Relies on Phoenix being installed.

## Installing components

#### All components can be installed by running the following mix command in your project root

```
mix bloom.install <component_name>
```

Some components require Tailwind Config changes - refer to the component doc for more information.

#### View all components by running:

```
mix bloom.install help
```

#### Install Ecto-backed waitlist & landing page by running:

```
mix bloom.landing_page
```

You will need to run `mix ecto.gen.migration` to create the migration and copy and migrate the contents from waitlist.ex to complete.

You will also need to add the generated LiveView to your router.

## Frequently Asked Questions

### Why are the components manually installed?

So you can customise them to your hearts content and make them your own easily. The source code of the components will live in your project so you can tweak them as you see fit.

### The colours aren't showing up!

Tailwind treeshakes colours that aren't in use at compile time - this means dynamic ones set by Phoenix Components won't show if the colours aren't already part of the page. You can circumvent this by safelisting colours in your `tailwind.config.js` or ensuring the colours are already in use (not recommended).

See the [Tailwind website](https://tailwindcss.com/docs/content-configuration) for more information.

You can safelist by Regex or manually.

Recommended safelist:

```
  safelist: [
    {
      pattern: /bg-+/,
      variants: ["focus", "hover", "group-hover", "active"],
    },
    {
      pattern: /text-+/,
      variants: ["focus", "hover", "group-hover", "active"],
    },
    {
      pattern: /from-+/,
      variants: ["focus", "hover", "group-hover", "active"],
    },
    {
      pattern: /to-+/,
      variants: ["focus", "hover", "group-hover", "active"],
    },
    {
      pattern: /inset-+/,
      variants: ["focus", "hover", "group-hover", "active"],
    },
    {
      pattern: /opacity-+/,
      variants: ["focus", "hover", "group-hover", "active"],
    },
    {
      pattern: /transition-+/,
      variants: ["focus", "hover", "group-hover", "active"],
    },
  ],
```

### There aren't many components

I'm gonna be adding components slowly but this repo welcomes contributions for beautiful, useful components not already covered by the excellent core_components that ship with Phoenix.

### How do I preview these components?

I'm going to be adding a Storybook and website soon.

## What needs work?

Everything!

This isn't a complete package yet - hence the version.

- Plenty of work to be done around the developer experience extracting the docs and making the installation of components even easier.
- Ways of collocating JS in an easy way until LiveView 1.0.
- Making the components better, mobile friendly, dark/light themes, standardising props
- Adding loads more components
- Reporting which Tailwind classes to safelist after publishing
- Turning this and the demo site into an umbrella application with git subdirectories

## Contribution

- Create your component in lib/bloom/components
- Adhere to Phoenix component standards
- Ensure any Tailwind config changes are documented in the @moduledoc
- Run `mix bloom.generate_templates` when ready to submit
- Increase semantic versioning for new publish
- Raise pull request
- Add Storybook story to [the bloom-ui site](https://github.com/chrisgreg/bloom/bloom_site) to demo component
