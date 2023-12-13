precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform int output;

void main() {
    // Apply gamma adjustment to monitor
    if (output == 1) {
        vec4 pixColor = texture2D(tex, v_texcoord);
        pixColor.rgb = pow(pixColor.rgb, vec3(1.2));
        gl_FragColor = pixColor;
    } else {
        gl_FragColor = texture2D(tex, v_texcoord);
    }
}
