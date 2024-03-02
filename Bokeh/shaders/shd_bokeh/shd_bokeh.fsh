//Texel size and mouse pos (0-1)
uniform vec2 texel;
uniform vec2 pos;

varying vec4 v_color;
varying vec2 v_coord;

//Number of texture samples. Higher = smoother, slower
#define SAMPLES 500.0

//Exposure level (1 = default, higher = more bokeh)
#define GAMMA (coord.x>.5?4.:1.)

vec4 bokeh(sampler2D tex, vec2 coord, float radius)
{
	//Initialize blur output color
	vec4 blur = vec4(0);
	//Total weight from all samples
	float total = 0.;
	
	//First sample offset
	float scale = radius*inversesqrt(SAMPLES);
	vec2 point = vec2(scale,0);
	
	//Golden angle rotation matrix
	mat2 ang = mat2(-0.7373688, -0.6754904, 0.6754904,  -0.7373688);
	
	//Look through all the samples
	for(float i = 0.0;i<SAMPLES;i++)
	{
		//Rotate point direction
		point *= ang;
		
		//Get sample coordinates
		vec2 uv = coord + point * sqrt(i) * texel;
		//Sample texture
        vec4 samp = texture2D(tex,uv);
		
		//Add sample to total
		blur += pow(samp, vec4(GAMMA));
	}
	//Get sample average
	blur /= SAMPLES;
	//Correct for exposure
	return pow(blur, 1.0/vec4(GAMMA));
}

void main()
{
	float radius = pos.y*20.; // (v_coord-pos).y*20.;
    gl_FragColor = bokeh(gm_BaseTexture, v_coord, radius);
}
