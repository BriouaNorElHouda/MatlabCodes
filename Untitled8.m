clc
spmd
 switch labindex
case 3
string = 'Hello lab 1.';
 labBroadcast(3,string);
case 1
data = labBroadcast(3)
case 2
 data = labBroadcast(3)
case 4
data = labBroadcast(3)
 end
end