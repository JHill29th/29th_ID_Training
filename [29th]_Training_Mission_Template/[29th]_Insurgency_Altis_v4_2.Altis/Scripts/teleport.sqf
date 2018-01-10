_dest = (_this select 3) select 0;
_dir = random 359;
player SetPos [(getPos _dest select 0)-2*sin(_dir),(getPos _dest select 1)-2*cos(_dir)];  