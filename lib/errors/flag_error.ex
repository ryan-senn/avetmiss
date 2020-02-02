defmodule Avetmiss.Errors.FlagError do
  defexception [:message]

  @impl true
  def exception(value) do
    msg = "Given value can't be interpreted as AVETMISS flag. Value: #{value}"
    %Avetmiss.Errors.FlagError{message: msg}
  end
end
