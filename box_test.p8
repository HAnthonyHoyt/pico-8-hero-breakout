pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
box_x=32
box_y=58
box_w=64
box_h=12

rayx=0
rayy=0
raydx=-2
raydy=-2

debug1="debug"

function _init()
end

function _update()
 if btn(1) then
  rayx+=1
 end
 if btn(0) then
  rayx-=1
 end
 if btn(2) then
  rayy-=1
 end
 if btn(3) then
  rayy+=1
 end
end

function _draw()
 cls()
 rect(box_x, box_y, box_x+box_w, box_y+box_h, 7)
 local px, py = rayx, rayy
 repeat
  pset(px, py, 8)
  px+=raydx
  py+=raydy
 until px<0 or px>128 or py<0 or py>128
 if deflx_ball_box(rayx,rayy,raydx,raydy,box_x,box_y,box_w,box_h) then
  print("horizontal")
 else
  print("vertical")
 end
 print(debug1)
end

function hit_ball_box(bx,by,tx,ty,tw,th)
 if bx+ball_r < tx then return false end
 if by+ball_r < ty then return false end
 if bx-ball_r > tx+tw then return false end
 if by-ball_r > ty+th then return false end
 return true
end

function deflx_ball_box(bx,by,bdx,bdy,tx,ty,tw,th)
 -- calculate whether to deflect the ball
 
 -- horizontally or vertically when it hits a box
 if bdx == 0 then
  -- moving vertically
  return false
 elseif bdy == 0 then
  -- moving horizontally
  return true
 end
 
 -- moving diagonally
 -- calculate slope
 local slp = bdy/bdx
 local cx, cy
 -- check variants
 if slp > 0 and bdx > 0 then
  -- moving down right
  debug1="q1"
  cx = tx-bx
  cy = ty-by
  if cx<=0 then
   return false
  elseif cy/cx < slp then
   return true
  end
  return false
 elseif slp < 0 and bdx > 0 then
  -- moving up right
  debug1="q2"
  cx = tx-bx
  cy = ty+th-by
  if cx <= 0 then
   return false
  elseif cy/cx < slp then
   return false
  end
  return true
 elseif slp > 0 and bdx < 0 then
  -- moving left up
  debug1="q3"
  cx=tx+tw-bx
  cy=ty+th-by
  if cx>=0 then
   return false
  elseif cy/cx > slp then
   return false
  end
  return true
 end
 -- moving left down
 debug1="q4"
 cx=tx+tw-bx
 cy=ty-by
 if cx>=0 then
  return false
 elseif cy/cx<slp then
  return false
 end
 return true
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
