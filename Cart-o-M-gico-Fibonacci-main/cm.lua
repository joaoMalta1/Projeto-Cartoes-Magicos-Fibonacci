
local cm = {}
ls_fb = {}
c = {}
hit_box_d = {
  x = 735,
  y = 540,
  w = 50,
  h = 50
}
hit_box_e = {
  x = 15,
  y = 540,
  w = 50,
  h = 50
}
hit_box_b = {
  x = 750,
  y = 25,
  w = 25,
  h = 25
}
hit_box_down = {
  x = 390,
  y = 570,
  w = 20,
  h = 20
}
hit_box_up = {
  x = 390,
  y = 30,
  w = 20,
  h = 20
}
button_color = {}
desce = {}
function cm.load()
  love.graphics.setBackgroundColor(0,0.89,0.7)
  timer = 0
  i1 = 1
  cria_lista()
  oMaior = encontra_maior()
  cria_listas()
  desloca_direita = false
  desloca_esquerda = false
  desloca_baixo = false
  desloca_cima = false
  camera_x = 0
  camera_y = 0
  ver_c = 1
  muda_cor()
  preenche_cm()
end
function cria_lista()
  ls_fb[1] = 1
  ls_fb[2] = 2
  for i=3, qtd_cartelas, 1 do
    ls_fb[i] = ls_fb[i-1]+ls_fb[i-2]
  end
end
function encontra_maior()
  maior = 0
  for i = #ls_fb,1,-2 do
    maior = maior + ls_fb[i]
  end
  return maior
end
function cria_listas()
  for i=1,#ls_fb do
    c[i] = {}
  end
end
function encontra_maior_sub(num)
  l = {}
  for i=#ls_fb,1,-1 do
    if num-ls_fb[i] >= 0 then -- 10 - 8 = 2 
      num = num-ls_fb[i]
      l[#l+1] = i
    end
  end
  return l
end
function preenche_cm()
  add_l = {}
  i1 = 0
  j = 0
  for num=1, oMaior do
    add_l = encontra_maior_sub(num)
    for i=1,#add_l do
      i1 = add_l[i]
      j = #c[i1]+1
      c[i1][j] = num
    end
  end
end
function muda_cor()
  for i=1, #ls_fb do
    button_color[i] = false
  end
end
function qtd_num(i)
  number1 = #c[i]
  num = number1/100
  desce[i] = num
  return num
end
function cm.update(dt)
  timer = timer + dt
  if desloca_direita == true then
    desloca_direita = not desloca_direita
    camera_x = camera_x + 800
    ver_c = ver_c+1
  end
  if desloca_esquerda == true then
    desloca_esquerda = not desloca_esquerda
    camera_x = camera_x - 800
    ver_c = ver_c-1
  end
  if desloca_baixo == true then
    desloca_baixo = not desloca_baixo
    camera_y = camera_y + 600
  end
  if desloca_cima == true then
    desloca_cima = not desloca_cima
    camera_y = camera_y - 600
  end
end
function cm.draw()
  love.graphics.setFont(font)
  love.graphics.setColor(0,0,0)
  love.graphics.translate(-camera_x, -camera_y)
  if timer < 3 then
    drawCenteredText(x, y, w, h, "Pense em um numero de")
    drawCenteredText(x+200, y, w, h, 1)
    drawCenteredText(x+225, y, w, h, "a")
    love.graphics.print(oMaior,640,230)
  end
  if timer < 8 and timer > 3 then
    drawCenteredText(x, y, w, h, "Marque as cartelas que" )
    drawCenteredText(x, y+35, w, h, "possuem o numero que pensou.") 
  end
  if timer > 8 then
    j = 0
    for i=1, #ls_fb do
      love.graphics.setColor(0,0,0)
      love.graphics.setFont(font)
      drawCenteredText(x+800*(i-1), y-200, w, h, "Cartela")
      love.graphics.print(i,465+800*(i-1),29)
      for j=0,qtd_num(i) do
        love.graphics.setColor(1,1,1)
        love.graphics.rectangle("fill",75+800*(i-1),75+600*j,650,450)
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("line",75+800*(i-1),75+600*j,650,450)
        if qtd_num(i) > 1 and j < qtd_num(i) then
          love.graphics.setColor(0,0,1)
          love.graphics.polygon("fill", 390+800*(i-1), 570+600*(j-1), 410+800*(i-1), 570+600*(j-1), 400+800*(i-1), 590+600*(j-1))
          love.graphics.polygon("fill", 390+800*(i-1), 50+600*(j+1), 410+800*(i-1), 50+600*(j+1), 400+800*(i-1),30+600*(j+1))
          love.graphics.setColor(0,0,0)
          love.graphics.polygon("line", 390+800*(i-1), 570+600*(j-1), 410+800*(i-1), 570+600*(j-1), 400+800*(i-1), 590+600*(j-1))
          love.graphics.polygon("line", 390+800*(i-1), 50+600*(j+1), 410+800*(i-1), 50+600*(j+1), 400+800*(i-1),30+600*(j+1))
        end
        for i1=1, 10 do
          love.graphics.rectangle("line",75+65*(i1-1)+800*(i-1),75+600*j,65,450)
          love.graphics.rectangle("line",75+800*(i-1),75+45*(i1-1)+600*j,650,45)
        end
        love.graphics.setFont(fonte)
        j1 = 0
        k = 0
        i2 = 0
        w1 = 0
        for j2=1, #c[i] do
          if j1 == 10 then
            j1 = 0
            k = k +1
            i2 = i2 +1
          end
          if i2 == 10 then
            i2 = 0
            w1 = w1+1
            k = 0
          end
          love.graphics.print(tostring(c[i][j2]), 80+800*(i-1)+65*j1,90+45*k+600*w1)
          j1 = j1+1
        end
      end
      if i ~= #ls_fb then
        love.graphics.setColor(0,0,1)
        love.graphics.polygon("fill", 735+800*(i-1), 540, 735+800*(i-1), 590, 785+800*(i-1), 565)
        love.graphics.setColor(0,0,0)
        love.graphics.polygon("line", 735+800*(i-1), 540, 735+800*(i-1), 590, 785+800*(i-1), 565)
      end
      if i ~= 1 then
        love.graphics.setColor(0,0,1)
        love.graphics.polygon("fill", 65+800*(i-1), 540, 65+800*(i-1), 590, 15+800*(i-1), 565)
        love.graphics.setColor(0,0,0)
        love.graphics.polygon("line", 65+800*(i-1), 540, 65+800*(i-1), 590, 15+800*(i-1), 565)
      end
      if button_color[i] == false then
        love.graphics.setColor(1,0,0)
      end
      if button_color[i] == true then
        love.graphics.setColor(0,1,0)
      end
      love.graphics.rectangle("fill",750+800*(i-1),25,25,25)
      love.graphics.setColor(0,0,0)
      love.graphics.rectangle("line",750+800*(i-1),25,25,25)
    end
  end
end
function cm.keypressed(key)
  if key == "return" then
    goToRes()
  end
end
local function comeca_simulacao (mx, my, x, y, w, h) 
  return mx >= x and mx <= x + w and my >= y and my <= y + h
end
function cm.mousepressed(x,y,button)
  if button == 1 and comeca_simulacao(x, y, hit_box_d.x , hit_box_d.y, hit_box_d.w, hit_box_d.h) and camera_x < 800*(#ls_fb-1) then
    desloca_direita = true
  end
  if button == 1 and comeca_simulacao(x, y, hit_box_e.x , hit_box_e.y, hit_box_e.w, hit_box_e.h) and camera_x > 15 then
    desloca_esquerda = true
  end
  if button == 1 and comeca_simulacao(x, y, hit_box_b.x , hit_box_b.y, hit_box_e.w, hit_box_b.h) then
    for i=1, #ls_fb do
      if camera_x == 800*(i-1) then
        button_color[i] = not button_color[i]
      end
    end
  end
  if button == 1 and comeca_simulacao(x, y, hit_box_down.x , hit_box_down.y, hit_box_down.w, hit_box_down.h) then
    if camera_y < 600*(desce[ver_c]-1) then
      desloca_baixo = not desloca_baixo
    end
  end
  if button == 1 and comeca_simulacao(x, y, hit_box_up.x , hit_box_up.y, hit_box_up.w, hit_box_up.h) and camera_y > 0 then
    desloca_cima = not desloca_cima
  end
end
return cm