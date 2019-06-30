/// @description Initialize cutscene

instance_create_layer(0, 0, "FadeIn", obj_fadein);

hanna = instance_create_layer(322, 834, "Instances", obj_hanna_outro);
fredrik = instance_create_layer(350, 834, "Instances", obj_fredrik_outro);

//All lines
talkboxes = ds_list_create();

var talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_fredrik_face;
talkbox.name = "Fredrik";
talkbox.text = "Thank you for saving me Hanna!\n You're the best, I love you!";
talkbox.sound = snd_fredrik_outro_1;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_hanna_face;
talkbox.name = "Hanna";
talkbox.text = "I love you too Fredrik!";
talkbox.sound = snd_hanna_outro_1;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_fredrik_face;
talkbox.name = "Fredrik";
talkbox.text = "As thanks for saving me, let's go\n to Grona Lund! This afternoon!";
talkbox.sound = snd_fredrik_outro_2;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_hanna_face;
talkbox.name = "Hanna";
talkbox.text = "Yaaaaay! Let's go!";
talkbox.sound = snd_hanna_outro_2;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

//Fredrik first line
alarm[0] = 4*room_speed;
first_line = false;
second_line = false;
third_line = false;
fourth_line = false;

audio_stop_all();
audio_play_sound(snd_outdoors, 3, true);