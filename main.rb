require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'

backwindow = BackWindow.new
hero = Hero.new( BackWindow::WINDOW_WIDTH / 2, BackWindow::SKYLINE)

Window.loop do
  hero.move

  backwindow.draw
  hero.draw

  # ジャンプ
  hero.jump

  break if Input.key_push?(K_ESCAPE)
end