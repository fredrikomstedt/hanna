/// @author Fredrik Omstedt
/// @description 

//Determine frame delta
seconds_passed = delta_time/1000000;

//Determine input pressed
d_key = keyboard_check(ord("D"));
a_key = keyboard_check(ord("A"));
space_key = keyboard_check_pressed(vk_space);
space_key_let_go = keyboard_check_released(vk_space);
heal_key = keyboard_check_pressed(ord("2"));