pico-8 cartridge // http://www.pico-8.com
version 34
__lua__
ball_x=1
ball_y=33
ball_dx=2
ball_dy=2
ball_r=2
ball_dr=0.5
frame=0
col=0

function _init()
 cls()
end

function _update()
 frame=frame+1
 ball_x=ball_x+ball_dx
 ball_y=ball_y+ball_dy

 if ball_x > 127 or ball_x < 0 then
  ball_dx = -ball_dx
  sfx(0)
 end
 if ball_y > 127 or ball_y < 0 then
  ball_dy = -ball_dy
  sfx(0)
 end
end

function _draw()
 rectfill(0,0,127,127,1)
 circfill(ball_x,ball_y,ball_r, 10)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001836018360183501833018320183100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
