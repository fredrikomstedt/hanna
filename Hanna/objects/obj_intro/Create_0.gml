/// @description Initialize cutscene

instance_create_layer(0, 0, "FadeIn", obj_fadein);

hanna = instance_create_layer(322, 834, "Instances", obj_hanna_intro);
fredrik = instance_create_layer(350, 834, "Instances", obj_fredrik_intro);
dr_demon = instance_create_layer(room_width+128, 802, "Instances", obj_dr_demon_intro);
dr_demon.intro_controller = self;

//All lines
talkboxes = ds_list_create();

var talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_fredrik_face;
talkbox.name = "Fredrik";
talkbox.text = "What a lovely day! And I get to\nspend it with you Hanna!";
talkbox.sound = snd_fredrik_intro_1;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_hanna_face;
talkbox.name = "Hanna";
talkbox.text = "Yaaas, this is great! I wish this could\n last forever!";
talkbox.sound = snd_hanna_intro_1;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_dr_demon_face;
talkbox.name = "Dr. Demon";
talkbox.text = "Urgh, I can't stand your affection\ntowards each other. I am taking Fredrik\n to my lair, The Arena!";
talkbox.sound = snd_dr_demon_intro;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_fredrik_face;
talkbox.name = "Fredrik";
talkbox.text = "NOOOOOOOooooooo...";
talkbox.sound = snd_fredrik_intro_2;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, 0, "GUI", obj_talkbox);
talkbox.person = spr_hanna_face;
talkbox.name = "Hanna";
talkbox.text = "I have to save Fredrik! I will follow Dr. Demon\n to The Arena!";
talkbox.sound = snd_hanna_intro_2;
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

//Fredrik first line
alarm[0] = 4*room_speed;
first_line = false;
second_line = false;
third_line = false;
fourth_line = false;
fifth_line = false;

audio_stop_all();
audio_play_sound(snd_outdoors, 3, true);