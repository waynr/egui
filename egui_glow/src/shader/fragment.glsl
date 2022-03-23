#ifdef GL_ES
    precision mediump float;
#endif

uniform sampler2D u_sampler;

#ifdef NEW_SHADER_INTERFACE
    in vec4 v_rgba;
    in vec2 v_tc;
    out vec4 f_color;
    // a dirty hack applied to support webGL2
    #define gl_FragColor f_color
    #define texture2D texture
#else
    varying vec4 v_rgba;
    varying vec2 v_tc;
#endif

void main() {
    gl_FragColor = v_rgba * texture2D(u_sampler, v_tc);
}
