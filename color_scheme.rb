module GnomeTermColors
  class ColorScheme
    def palette
      raise "Must supply a palette"
    end

    def background_color
      raise "Must supply a background color"
    end

    def foreground_color
      raise "Must supply a foreground color"
    end

    def bold_color
      raise "Must supply a bold color"
    end
  end
end

