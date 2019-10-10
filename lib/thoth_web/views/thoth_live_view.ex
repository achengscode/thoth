defmodule ThothWeb.ThothLiveView do
  use Phoenix.LiveView
  alias ThothWeb.ThothView

  def render(assigns) do
    ThothView.render("render.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, input_md: nil, output_html: nil)}
  end

  def handle_event("render", %{"input_md" => input_md}, socket) do
    # assume everthing is markdown for now and translate to html
    {:ok, output_html} = Pandex.gfm_to_html5(input_md)
    {:noreply, assign(socket, output_html: output_html)}
  end
end
