
local menu = require "menu"
local resultado = require "resultado"
local cm = require "cm"
local tela = menu
font = love.graphics.newFont("RevereNormal.ttf", 36)
fonte = love.graphics.newFont("RevereNormal.ttf", 18)
function love.load()
  tela = menu
  x = 0
  y = -50
  w = 800
  h = 600
  tela.load()
end  
function love.update(dt)
  if dt > 0.040 then return end
  tela.update(dt)
end
function drawCenteredText(rectX, rectY, rectWidth, rectHeight, text)
	local font       = love.graphics.getFont()
	local textWidth  = font:getWidth(text)
	local textHeight = font:getHeight()
	love.graphics.print(text, rectX+rectWidth/2, rectY+rectHeight/2, 0, 1, 1, textWidth/2, textHeight/2)
end
function love.draw() 
  
  tela.draw()
  
end
function love.keypressed(key)
  tela.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end
function love.mousepressed(x,y,button)
  tela.mousepressed(x, y, button)
end
function goToMenu()
  menu.load()
  tela = menu
end
function goToCM()
  cm.load()
  tela = cm
end
function goToRes()
  resultado.load()
  tela = resultado
end