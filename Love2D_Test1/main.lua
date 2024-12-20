function love.load()
  game_over = false
  did_touch = false
  score = 0
  d_speed = 350
  p1 = {
    x = 100,
    y = 50,
    width = 200,
    height = 50
  }

  b1 = {
    x = 300,
    y = 300,
    r = 25,
    seg = 25
  }
  balldir = {
    x = 2,
    y = 2
  }
end

function CheckCollision(x1, e1, x2, y2, dt)
  if y2 <= 125 and x2 >= x1 then
    for i = x1,e1 do
      if i >= x2 then
        balldir.y = d_speed * dt
        did_touch = true
      end
    end
  end
  if did_touch == true then
    score = score + 1
    if score % 5 == 0 then
      d_speed = d_speed + 100
    end
  end
  did_touch = false
end

function BallMovement(dt)
  if b1.x >= 775 then
    balldir.x = -d_speed * dt
  end
  if b1.x <= 25 then
    balldir.x = d_speed * dt
  end

  if b1.y >= 575 then
    balldir.y = -d_speed * dt
  end
  if b1.y <= 25 then
    balldir.y = d_speed * dt
    game_over = true
  end

  b1.x = b1.x + balldir.x
  b1.y = b1.y + balldir.y
end


function love.update(dt)
  endpoint = p1.x + 200
  
  CheckCollision(p1.x, endpoint, b1.x, b1.y, dt)
  BallMovement(dt)
  
  if love.keyboard.isDown("right") then
    p1.x = p1.x + 500 * dt
  end
  if love.keyboard.isDown("left") then
    p1.x = p1.x - 500 * dt
  end


  
end

function love.draw()
  if game_over == false then
    love.graphics.print(d_speed)
    love.graphics.print(score, 400, 300)
    love.graphics.rectangle("fill", p1.x, p1.y, p1.width, p1.height)
    love.graphics.circle("fill", b1.x, b1.y, b1.r, b1.seg)
  else if game_over == true then
    love.graphics.print('GameOver')
  end
end
end
