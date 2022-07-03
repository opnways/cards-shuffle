defmodule Cards do
  @moduledoc """
    Provee metodos para crear y barajar cartas
  """
  @doc """
  Listado de valores y palos que generan la baraja completa
  """
  def create_deck do
  values =  ["As", "dos", "tres", "cuatro", "cinco", "seis"]
  suits = ["Picas", "trebol", "Rombos", "Corazones"]
    for value <- values, suit <- suits do
      "#{value} de #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    Determina si una carta está en la mano

    ## Ejemplo
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "As de Picas")
      true
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end
  @doc """
  Divide la baraja en dos arrays, el mazo y la mano, en la que `hand_size` es la cantidad de cartas
  que se van a repartir.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["As de Picas"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case  File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File not found"
    end

  end

  def create_hand(hand_size) do
   Cards.create_deck
    |>Cards.shuffle
    |>Cards.deal(hand_size)
  end
end
