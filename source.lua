t=1
m=math
s=m.sin
for j=0,47 do 
   poke(16320+j,s(j/15+s(j%3/9))^2*255)
end

function TIC()
   t=t+.25
   for y= -68,67 do
      for x=-120,119 do
	 d3 = (x*x+y*y)^.5
	 d2 = m.max(x*x,y*y)
	 r  = .2
	 d1 = m.abs(8*r*x*(3*y^2-x^2)+18*r*(x^2+y^2))
	 if d1>1e5 then
	    c = (m.atan2(y,x)*2.546+1e6/(1+d1))//1+ t//1
	 elseif d2> 200 then
	    c = (m.atan2(y,x)*2.546+1e4/(1+d2))//1+ t//1.5
	 else
	    c = (m.atan2(y,x)*2.546+1e2/(1+d3))//1+ t//2
	 end			 
	 pix(120+x,68+y,(c&11)+5*s((x+y)/25)+s(x-y-t)%2)
      end
   end
end
