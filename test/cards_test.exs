defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "crear mazo 24 cartas" do
    deck_lenght = length(Cards.create_deck)
    assert deck_lenght == 24
  end

  test "shuffling a deck randomize" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
