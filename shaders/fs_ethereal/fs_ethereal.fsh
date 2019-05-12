//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;

void main()
{
    vec2 v_adjustedTexCoord = v_vTexcoord;
    v_adjustedTexCoord.y += sin(time*v_adjustedTexCoord.x*5.0)*.01;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_adjustedTexCoord );
}

