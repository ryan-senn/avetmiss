defmodule Avetmiss.Errors.StateError do
  defexception [:message]

  @impl true
  def exception(value) do
    msg = "Given value is not a valid state. Value: #{value}"
    %Avetmiss.Errors.StateError{message: msg}
  end
end
