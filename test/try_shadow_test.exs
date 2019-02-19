defmodule TryShadowTest do
  use ExUnit.Case

  describe "to_case" do
    test "it should return valid number" do
      assert TryShadow.to_case(123456789) == 123456789
    end

    test "it should return valid error" do
      assert TryShadow.to_case(1234567890) == "odds are bad!"
    end
  end

  describe "to_try" do
    test "it should return valid number" do
      assert TryShadow.to_try(123456789) == 123456789
    end

    test "it should return valid error" do
      assert TryShadow.to_try(1234567890) == "odds are bad!"
    end
  end

  describe "to_throw" do
    test "it should return valid number" do
      assert TryShadow.to_throw(123456789) == 123456789
    end

    test "it should return valid error" do
      assert TryShadow.to_throw(1234567890) == "odds are bad!"
    end
  end

  describe "to_raise" do
    test "it should return valid number" do
      assert TryShadow.to_raise(123456789) == 123456789
    end

    test "it should return valid error" do
      assert TryShadow.to_raise(1234567890) == %RuntimeError{message: "odds are bad!"}
    end
  end
end
