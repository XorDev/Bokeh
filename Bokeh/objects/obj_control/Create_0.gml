///@desc Initialize uniforms

draw_set_font(fnt_main);
gpu_set_tex_filter(1);

uni_texel = shader_get_uniform(shd_bokeh,"texel");
uni_pos = shader_get_uniform(shd_bokeh,"pos");