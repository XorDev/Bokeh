///@desc Draw with shader

if keyboard_check(vk_escape) game_end();

var _tex,_w,_h;
_tex = surface_get_texture(application_surface);
_w = texture_get_texel_width(_tex);
_h = texture_get_texel_height(_tex);

shader_set(shd_bokeh);
shader_set_uniform_f(uni_texel,_w,_h);
shader_set_uniform_f(uni_pos,mouse_x/room_width,mouse_y/room_height);
draw_surface(application_surface,0,0);
shader_reset();


draw_set_color(0);
draw_line(room_width/2,0,room_width/2,room_height);

draw_text(8,8,"Standard Blur");
draw_text(room_width/2+8,8,"Gamma Blur");