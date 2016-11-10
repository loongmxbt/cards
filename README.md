# Cards

Provides methods for creating and handling a deck of cards.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `cards` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:cards, "~> 0.1.0"}]
    end
    ```

  2. Ensure `cards` is started before your application:

    ```elixir
    def application do
      [applications: [:cards]]
    end
    ```

## Usage
```
iex(1)>  {hand, rest} = Cards.create_deck |> Cards.shuffle |> Cards.deal(5)
{["H-6", "H-K", "S-K", "D-6", "D-2"],
 ["C-9", "H-A", "S-5", "C-A", "S-2", "H-3", "C-2", "D-A", "D-10", "C-7", "C-3",
  "S-6", "H-9", "H-4", "S-8", "S-A", "D-Q", "D-9", "C-5", "H-2", "D-7", "S-7",
  "S-J", "S-9", "C-K", "H-Q", "D-J", "D-5", "S-Q", "S-10", "C-J", "C-Q", "D-K",
  "C-4", "S-3", "H-7", "C-8", "C-6", "D-3", "S-4", "D-8", "H-10", "H-8", "D-4",
  "C-10", "H-5", "H-J"]}
iex(2)> hand
["H-6", "H-K", "S-K", "D-6", "D-2"]
 ```
