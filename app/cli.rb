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
      @user = User.create(user_name: @user_name, origin: nil, destination: nil)
      get_origin
      get_destination
    end
    @user.affected_lines_array(@origin_id, @destination_id)
    Trip.create(origin: @user.origin, destination: @user.destination, user_id: @user.id) # @user.route_lines,
  end

  def check_same_route
    route_check = $prompt.yes?("I see, I see, are you the same #{@user.user_name} that was a bit slow going between #{@user.origin} and #{@user.destination}?")
    if route_check == true
      same_route = $prompt.yes?("Good show! Want me to make you an excuse for the same route?")
      if same_route == true
        origin = @user.origin
        destination = @user.destination
      else
        get_origin
        get_destination
      end
    else
      @user = User.create(user_name: @user_name)
      get_origin
      get_destination
    end
  end

  def get_name
    @user_name = $prompt.ask("Can I get a name for you?", required: true) do |q|
      q.required true
      q.modify :capitalize
    end
  end

  def get_origin
    origin_name = $prompt.ask("Let's begin the grand lie, where are you starting from?", required: true) do |q|
      q.required true
      q.modify :capitalize
    end
    @user.update(origin: origin_name)
    origin = Station.find_by_commonName(origin_name)
    @origin_id = origin.icsCode
  end

  def get_destination
    destination_name = $prompt.ask("And where are you going?", required: true) do |q|
      q.required true
      q.modify :capitalize
    end
    @user.update(destination: @destination)
    destination = Station.find_by_commonName(destination_name)
    @destination_id = destination.icsCode
  end

  def return_excuse
    puts Excuse.random_excuse + " on the " + @user.affected_line + "!"
  end
end