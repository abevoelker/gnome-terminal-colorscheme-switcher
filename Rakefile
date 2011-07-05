require 'rake'

$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

desc "set a colorscheme"
task :set do |t, args|
  raise "Please supply a color scheme (scheme=foo)" if ENV['scheme'].nil?
  if ENV['profile'].nil? then
    puts "Profile not specified; using 'Default'"
    ENV['profile'] = 'Default'
  end

  # Load all color schemes
  load_schemes

  # Dynamically instantiate the color scheme class
  scheme = Module.const_get("GnomeTermColors").const_get(ENV['scheme']).new

  # Set the colors
  gconf_set_profile_option ENV['profile'], 'palette', scheme.palette, 'string'
  gconf_set_profile_option ENV['profile'], 'background_color', scheme.background_color, 'string'
  gconf_set_profile_option ENV['profile'], 'foreground_color', scheme.foreground_color, 'string'
  gconf_set_profile_option ENV['profile'], 'bold_color', scheme.bold_color, 'string'

  # Set some needed things
  gconf_set_profile_option ENV['profile'], 'bold_color_same_as_fg', 'false', 'bool'
  gconf_set_profile_option ENV['profile'], 'use_theme_colors', 'false', 'bool'
end

# Load the available color schemes into memory
def load_schemes
  Dir['colorschemes/*.rb'].each { |file| require file }
end

def gconf_set_profile_option(profile, option, value, type)
  system("gconftool-2 -s -t #{type} /apps/gnome-terminal/profiles/" +
         "#{profile}/#{option} #{value}")
end
