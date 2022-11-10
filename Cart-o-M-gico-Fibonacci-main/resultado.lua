local resultado = {}

function resultado.load()
  love.graphics.setBackgroundColor(0,0.89,0.7)
  for i=1, #button_color do
    if button_color[i] == true then
      number = number + ls_fb[i]
    end
  end
end
function resultado.update(dt)


end
function resultado.draw()
  love.graphics.setFont(font)
  drawCenteredText(x, y-200, w, h, "O numero que pensou foi . . .")
  drawCenteredText(x, y, w, h, number)
end
function resultado.keypressed(key)
  if key == "return" then
    goToMenu()
  end
end
function resultado.mousepressed(x,y,button)
  
end
return resultado