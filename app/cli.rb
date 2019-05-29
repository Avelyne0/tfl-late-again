class CLI
  def run
    launch_app
    get_name
    check_same_name
    if check_same_name == true
      check_same_route
      if check_same_route == true
        
    get_origin
    get_destination
  end

  def initialize
    $prompt = TTY::Prompt.new
  end

  def launch_app
    $prompt.keypress("Late again, huh? go ahead and hit space to begin.", keys: [:space, :return])
  end

  # enter your name
  def get_name
    user_name = $prompt.ask("Can I get a name for you?", required: true) do |q|
      q.required true
      q.modify   :capitalize
    end
  end

  def check_same_name(user_name, origin, destination)
    $prompt.yes?("I see, I see, are you the same #{user_name} that was a bit slow going from #{origin} to #{destination}?")
  end

  def check_same_route
    $prompt.yes?("Good show! Want me to make you an excuse for the same route?")
  end

  def get_origin
    origin = $prompt.ask("Let's begin the great lie, where are you starting from?", required: true) do |q|
      q.required true
      q.modify   :capitalize
    end
  end

  def get_destination
    destination = $prompt.ask("And where are you going?", required: true) do |q|
      q.required true
      q.modify   :capitalize
    end
  end

  # check against other names in the database
  # User.find_by name: user_name
  # ask user if that name is the same person that made last journey
  # # if yes ask user if they're making the same journey as last time
  # prompt.yes?("Good show! Want me to make you an excuse for the same route?")
end