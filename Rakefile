require 'rake'

$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'color_scheme.rb'
include GnomeTermColors

desc "set a colorscheme"
task :set do |t, args|
  raise "Please supply a color scheme (scheme=foo)" if ENV['scheme'].nil?
  if ENV['profile'].nil? then
    ENV['profile'] = 'Default'
    puts "Profile not specified; using '#{ENV['profile']}'"
  end

  # Load desired scheme
  cs = load_scheme(ENV['scheme'])

  # Set the colors
  gconf_set_profile_option ENV['profile'], 'palette', cs.palette, 'string'
  gconf_set_profile_option ENV['profile'], 'background_color', cs.background_color, 'string'
  gconf_set_profile_option ENV['profile'], 'foreground_color', cs.foreground_color, 'string'
  gconf_set_profile_option ENV['profile'], 'bold_color', cs.bold_color, 'string'

  # Set some needed things
  gconf_set_profile_option ENV['profile'], 'bold_color_same_as_fg', 'false', 'bool'
  gconf_set_profile_option ENV['profile'], 'use_theme_colors', 'false', 'bool'
  gconf_set_profile_option ENV['profile'], 'use_theme_background', 'false', 'bool'
end

def load_scheme(scheme)
  ColorScheme.new(:file => 'colorschemes/' + scheme + '.yml')
end

def gconf_set_profile_option(profile, option, value, type)
  system("gconftool-2 -s -t #{type} /apps/gnome-terminal/profiles/" +
         "#{profile}/#{option} #{value}")
end

