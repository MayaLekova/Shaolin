class HomeController < ApplicationController
  def index
    @home_title = "Welcome to Shaolin!"
    @home_text = <<HOMETEXT
    Shaolin is a dynamic platform for programming lessons in various languages. You can access lessons on the right from the 'Lessons' menu.
HOMETEXT
  end
end
