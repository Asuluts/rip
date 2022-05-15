//get input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calc Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,wall)) && (key_jump)
{
	vsp = -7;
}



// vert coll
if (place_meeting(x+hsp,y,wall))
{
	while (!place_meeting(x+sign(hsp),y,wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//Horz coll
if (place_meeting(x,y+vsp,wall))
{
	while (!place_meeting(x,y+sign(vsp),wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Animation
if (!place_meeting(x,y+1,wall))
{
	sprite_index = MC_run;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;	
}
else
{
	sprite_index = MC_run;
}



