defmodule Cards do

  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Returns a list of strings representing a deck of playing cards.
  """
  def create_deck do
    values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suits = ["S", "C", "H", "D"]

    for suit <- suits, value <- values do
      "#{suit}-#{value}"
    end
  end

  @doc """
  Returns a shuffled deck.
  """
  def shuffle(deck) do
    deck |> Enum.shuffle
  end

  @doc """
  Whether current deck contains hand.

  ## Examples

      iex(1)> deck = Cards.create_deck
      iex(2)> Cards.contains?(deck, "S-A")
      true

  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should
  be in the hand.

  ## Examples

      iex(1)> deck = Cards.create_deck
      iex(2)> {hand, deck} = Cards.deal(deck, 1)
      iex(3)> hand
      ["S-A"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Save deck to localfile.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Load deck from localfile.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
  Create a hand of a specified `hand_size`.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
