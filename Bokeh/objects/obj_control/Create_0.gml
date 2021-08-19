///@desc Initialize uniforms

gpu_set_tex_filter(1);

uni_texel = shader_get_uniform(shd_bokeh,"texel");
uni_pos = shader_get_uniform(shd_bokeh,"pos");