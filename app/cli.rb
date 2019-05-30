class CLI

  def run
    launch_app
    populate_user_data
    return_excuse
  end

  def initialize
    @user = ""
    $prompt = TTY::Prompt.new
  end

  def launch_app
    $prompt.keypress("Late again, huh? go ahead and hit space to begin.", keys: [:space, :return])
  end

  def populate_user_data
    get_name
    if User.exists?(user_name: @user_name)
      @user = User.find_by user_name: @user_name
      check_same_route
    else
      get_origin
      get_destination
      @user = User.create(user_name: @user_name, origin: @origin, destination: @destination)
    end
  end

  def get_name
    @user_name = $prompt.ask("Can I get a name for you?", required: true) do |q|
      q.required true
      q.modify :capitalize
    end
  end

  def check_same_name(name)

    # is a call to the users table to see if there is a user_name containing new user_name and returns the user_id
  end


  def check_same_route(id)
    Trips.find_by user_id: id
  end



  def check_same_route
    route_check = $prompt.yes?("I see, I see, are you the same #{@user.user_name} that was a bit slow going between #{@user.origin} and #{@user.destination}?")
    if route_check == true
      same_route = $prompt.yes?("Good show! Want me to make you an excuse for the same route?")
      if same_route == true
        @user.origin = @origin
        @user.destination = @destination
      else
        get_origin
        get_destination
      end
    else
      get_origin
      get_destination
    end
  end

  def get_origin
    @origin = $prompt.ask("Let's begin the grand lie, where are you starting from?", required: true) do |q|
      q.required true
      q.modify   :capitalize
    end
  end

  def get_destination
    @destination = $prompt.ask("And where are you going?", required: true) do |q|
      q.required true
      q.modify   :capitalize
    end
  end

  def return_excuse
    puts Excuse.random_excuse + " on the " + @user.affected_line + "!"
  end

  # check against other names in the database
  # User.find_by name: user_name

end