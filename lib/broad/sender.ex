defmodule Broad.Sender do
  @moduledoc false

  @one_second 1000

  require Logger

  def generate_some_emails(count \\ 10) do
    1..count |> Enum.map(&"#{&1}@hell.com")
  end

  def notify_all(emails) do
    emails
    |> Enum.each(&send_email/1)
  end

  def send_email(email) do
    Process.sleep(around_seconds(3))
    Logger.info("Sent email", email: email)
    {:ok, :email_sent}
  end

  defp around_seconds(seconds, miliseconds_variance \\ 300) do
    seconds * @one_second + variance(miliseconds_variance)
  end

  defp variance(miliseconds_variance),
    do: :rand.uniform(miliseconds_variance) * Enum.random([1, -1])
end
