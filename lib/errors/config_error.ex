defmodule Avetmiss.Errors.ConfigError do
  defexception [:message]

  @impl true
  def exception({config, key}) do
    msg = "Given key not found in AVETMISS config. Config: #{inspect(config)}, Key: #{key}"
    %Avetmiss.Errors.ConfigError{message: msg}
  end
end
