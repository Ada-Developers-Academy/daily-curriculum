require 'rubygems'
require 'gosu'

module ZOrder
  Player, UI = *0..1
end

class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "a.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def warp(x, y)
    @x = x
    @y = y
  end

  def left
  end

  def right
  end

  def up
  end

  def down
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
    @vel_x = @vel_y = 0
  end

  def draw
    @image.draw_rot(@x, @y, ZOrder::Player, @angle)
  end
end

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "Gosu Koan"
    
    @player = Player.new(self)
    @player.warp(320, 240)
  end

  def update
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.right
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.up
    end
    if button_down? Gosu::KbDown or button_down? Gosu::GpButton0 then
      @player.down
    end
    @player.move
  end

  def draw
    @player.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape then
      close
    end
  end
end

window = GameWindow.new
window.show
