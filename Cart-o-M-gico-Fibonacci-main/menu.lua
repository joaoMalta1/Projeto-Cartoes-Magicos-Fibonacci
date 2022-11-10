
local menu = {}

function menu.load()
  love.graphics.setBackgroundColor(0,0.89,0.7)
  number = 0
  oMaior = 0
  c = {}
  ls_fb = {}
  button_color = {}
  desce = {}
  qtd_cartelas = 0
end
function menu.update(dt)


end
function menu.draw()
  love.graphics.setFont(font)
  love.graphics.setColor(0,0,0)
  drawCenteredText(x, y, w, h, "Qual a quantidade de cartelas?")
  if qtd_cartelas ~= 0 then
    drawCenteredText(x, y+50, w, h, qtd_cartelas)
  end
end
function menu.keypressed(key)
  if key >= "0" and key <= "9" then
    qtd_cartelas = qtd_cartelas*10
    qtd_cartelas = qtd_cartelas + key
  end
  if key == "backspace" then
    qtd_cartelas = 0
  end
  if key == "return" then
    goToCM()
  end
end
function menu.mousepressed(x,y,button)
  
end
return menu