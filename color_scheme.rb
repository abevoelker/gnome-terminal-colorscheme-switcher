require 'yaml'

module GnomeTermColors
  class ColorScheme
    attr_reader :name, :background_color, :foreground_color, :bold_color

    def initialize(args)
      if args[:file]
        yml = YAML.load_file args[:file] if args[:file]
        @name = yml['name']
        @palette = yml['palette']
        @background_color = yml['background_color']
        @foreground_color = yml['foreground_color']
        @bold_color = yml['bold_color']
      end
    end

    def palette
      raise "Must supply a palette" if @palette.nil?
      @palette.join(':')
    end
  end
end

