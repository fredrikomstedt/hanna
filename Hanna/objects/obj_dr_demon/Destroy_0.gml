/// @description Create splat

var splat = instance_create_layer(x, bbox_bottom, "Instances", obj_spider_splat);
splat.image_xscale = 5;
splat.image_yscale = 5;


audio_play_sound(snd_dr_demon_dying, 7, false);

var fadeout = instance_create_layer(0, 0, "Fadeout", obj_fadeout);
fadeout.room_transition = rm_outro;