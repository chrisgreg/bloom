# Bloom

The opinionated extention to Phoenix core_components.
Inspired by shad-cn.

## Installation

Can be installed by adding `bloom` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bloom, "~> 0.0.2"}
  ]
end
```

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

## Frequently Asked Questions

### The colours aren't showing up!

Tailwind treeshakes colours that aren't in use at compile time - this means dynamic ones set by Phoenix Components won't show if the colours aren't already part of the page. You can circumvent this by safelisting colours in your `tailwind.config.js` or ensuring the colours are already in use (not recommended).

See the [Tailwind website](https://tailwindcss.com/docs/content-configuration) for more information.

You can safelist by Regex or manually.

Recommended safelist:

```
  safelist: [
    {
      pattern: /bg-+/,
    },
    {
      pattern: /text-+/,
    },
    {
      pattern: /from-+/,
    },
    {
      pattern: /to-+/,
    },
  ],
```
