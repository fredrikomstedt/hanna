/// @author Fredrik Omstedt
/// @description 

//Determine frame delta
seconds_passed = delta_time/1000000;

//Determine input pressed
d_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
a_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
space_key = keyboard_check_pressed(vk_space);
space_key_let_go = keyboard_check_released(vk_space);
spear_key = keyboard_check_pressed(ord("1"));
heal_key = keyboard_check_pressed(ord("2"));
fire_key = keyboard_check_pressed(ord("3"));