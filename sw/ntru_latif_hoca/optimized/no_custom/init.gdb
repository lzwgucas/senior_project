
set pagination off
set logging file gdb.txt
set logging on
file /home/topalc/Desktop/ibex-master/examples/sw/ntru_latif_hoca/optimized/no_custom/a.out
target sim
load a.out

start
set $ctr13 = 0
set $ctr50  = 0
set $ctr57 = 0
set $ctr88 = 0
set $ctr116 = 0
set $ctr123 = 0
set $ctr143 = 0
set $ctr206 = 0
set $ctr274 = 0
set $ctr306 = 0
set $ctr424 = 0
set $ctr512 = 0
set $ctr546 = 0
set $ctr569 = 0
set $ctr571 = 0


break NTRU_48_bitM.c:13
commands
	set $ctr13 = $ctr13 + 1
	c
end

break NTRU_48_bitM.c:50
commands
	set $ctr50 = $ctr50 + 1
	c
end

break NTRU_48_bitM.c:57
commands
	set $ctr57 = $ctr57 + 1
	c
end

break NTRU_48_bitM.c:88
commands
	set $ctr88 = $ctr88 + 1
	c
end

break NTRU_48_bitM.c:116
commands
	set $ctr116 = $ctr116 + 1
	c
end

break NTRU_48_bitM.c:123
commands
	set $ctr123 = $ctr123 + 1
	c
end

break NTRU_48_bitM.c:143
commands
	set $ctr143 = $ctr143 + 1
	c
end

break NTRU_48_bitM.c:206
commands
	set $ctr206 = $ctr206 + 1
	c
end

break NTRU_48_bitM.c:274
commands
	set $ctr274 = $ctr274 + 1
	c
end

break NTRU_48_bitM.c:306
commands
	set $ctr306 = $ctr306 + 1
	c
end

break NTRU_48_bitM.c:424
commands
	set $ctr424 = $ctr424 + 1
	c
end

break NTRU_48_bitM.c:512
commands
	set $ctr512 = $ctr512 + 1
	c
end

break NTRU_48_bitM.c:546
commands
	set $ctr546 = $ctr546 + 1
	c
end

break NTRU_48_bitM.c:569
commands
	set $ctr569 = $ctr569 + 1
	c
end

break NTRU_48_bitM.c:571
commands
	set $ctr571 = $ctr571 + 1
	c
end


r

 print $ctr13  
 print $ctr50   
 print $ctr57  
 print $ctr88  
 print $ctr116  
 print $ctr123  
 print $ctr143  
 print $ctr206  
 print $ctr274  
 print $ctr306  
 print $ctr424  
 print $ctr512  
 print $ctr546  
 print $ctr569  
 print $ctr571  

set logging off
quit
