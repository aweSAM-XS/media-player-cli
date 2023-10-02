defmodule MediaPlayer do
  alias MediaPlayer.Commands, as: Commands

  # Dotenv.load()
  # sam = String.split("#{System.get_env("SCYLLADB_NODE")}, #{System.get_env("SCYLLADB_USERNAME")}" , ",")
  # IO.puts(sam)

  def loop do
    IO.puts("-------------------------------------")
    IO.puts("Commands: !add | !list | !delete | !stress | !exit")
    IO.puts("Type any command: ")
    command = IO.gets("") |> Commands.trim

    case command do
      "!add" ->
        Commands.add()
        loop()

      "!list" ->
        Commands.list()
        loop()

      "!delete" ->
        Commands.delete()
        loop()

      "!stress" ->
        Commands.stress()
        loop()

      "exit" ->
        IO.puts("Bye bye!")
        :OK

      _ ->
        IO.puts("Command not found!")
        loop()
    end
  end

  def start(_, _) do
    run()
    {:ok, self()}
  end

  def run do
    IO.puts("-------------------------------------")
    IO.puts("- aweSAM Media Player -")
    IO.puts("-------------------------------------")
    IO.puts("Here are some possibilities")
    IO.puts(" !add - add new song")
    IO.puts(" !list - list all songs")
    IO.puts(" !delete - delete a specific song")
    IO.puts(" !stress - stress testing with mocked data")
    IO.puts("-------------------------------------")

    loop()
  end

  def awesam, do: "me so aweSAM :>"
end
