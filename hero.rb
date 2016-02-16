class Hero
  def initialize( x,y)
    @image=Image.load("image/hero.png")
    @image.set_color_key(Color::WHITE)
    @x = x
    @y = y - @image.height
    @speed = 3

    # 上方向への速さ（初期値は0）
    @v = 0

  end

  def move
    @x += Input.x * @speed
    if @x <= 0
      @x = 0
    end
    if @x >= BackWindow::WINDOW_WIDTH - @image.width
      @x = BackWindow::WINDOW_WIDTH - @image.width
    end
  end

  def draw
    Window.draw(@x, @y, @image) 
  end

  ##############################
  ## ルビィくんをジャンプさせる
  ##############################
  def jump
    # ジャンプする高さを設定（ジャンプ中は無効）
    @v = -20 if(Input.key_push?(K_SPACE))
    # ルビィくんの位置の設定（ジャンプしたなら数値は少なくなる）
    @y += @v
    if(@y >= (BackWindow::SKYLINE - @image.height))
      # ルビィくんが、地面に接している場合（めり込み制御）
      @y = BackWindow::SKYLINE - @image.height
      @v = 0
    end
    # ループを繰り返すと、どんどん速さが大きくなる
    @v += 1 # 最初は速さは負（上側）で、速さが０になると、速さは正（下側）になる
  end

end