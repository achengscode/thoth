defmodule ThothWeb.ThothLiveView do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <h1>
      Type stuff here
    </h1>

    <form phx-change='render'>
      <div id='raw-text'>
        <textarea name="input_md" phx-change="render">
          <%= @input_md %>
        </textarea>
      </div>
    </form>

    <div>
      <div id='rendered-text'>
        <%= @output_html %>
      </div>
    </div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket), do: IO.puts("WE'RE CONNECTED")
    {:ok, assign(socket, input_md: nil, output_html: nil)}
  end

  def handle_event("render", %{"input_md" => input_md}, socket) do
    # assume everthing is markdown for now and translate to html
    {:ok, output_html} = Pandex.gfm_to_html(input_md)
    {:noreply, assign(socket, output_html: output_html)}
  end
end
