# frozen_string_literal: true

# reusable app wide methods
class App
  def self.header(text = banner_text)
    banner = TTY::Box.frame(*banner_options) { text }
    system 'clear'
    print "#{banner}\n"
  end

  def self.banner
    header(banner_text)
  end

  def self.exit
    header(exit_text)
  end

  def self.banner_options
    [
      width: TTY::Screen.width,
      height: 12,
      align: :center,
      title: { top_left: '❤️ 🥂', bottom_right: '❤️ 🍻' },
      border: banner_border,
      style: banner_style
    ]
  end

  def self.banner_border
    {
      type: :thick,
      top_left: :divider_down,
      top_right: :divider_down,
      bottom_left: :divider_up,
      bottom_right: :divider_up
    }
  end

  def self.banner_style
    {
      fg: :black,
      bg: :white,
      border: { fg: :black, bg: :white }
    }
  end

  def self.banner_text
    "
         _    _           _           _  ______                                          
        | |  | |         | |         | | | ___ \\                                         
        | |  | | __ _ ___| |_ ___  __| | | |_/ / _____   _____ _ __ __ _  __ _  ___  ___ 
        | |/\\| |/ _` / __| __/ _ \\/ _` | | ___ \\/ _ \\ \\ / / _ \\ '__/ _` |/ _` |/ _ \\/ __|
        \\  /\\  / (_| \\__ \\ ||  __/ (_| | | |_/ /  __/\\ V /  __/ | | (_| | (_| |  __/\\__ \\
         \\/  \\/ \\__,_|___/\\__\\___|\\__,_| \\____/ \\___| \\_/ \\___|_|  \\__,_|\\__, |\\___||___/
                                                                          __/ |          
                                                                         |___/           
    "
  end

  def self.exit_text
    "\
                          _                    
                         {_}                   
                         |(|                   
                         |=|        .   ' .   
                        /   \\     '     \\~~~/
        C H E E R S !   |.--|    \\~~~/   \\_/ 
                        ||  |     \\_/     Y   
                        ||  |      Y     _|_   
                        |'--|     _|_          
                        '-=-'                  
    "
  end
end
