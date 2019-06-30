/// @description Create splat and mana

instance_create_layer(x, bbox_bottom, "Instances", obj_spider_splat);
instance_create_layer(x, bbox_top - 12, "Instances", obj_mana);
audio_play_sound(snd_splat, 7, false);