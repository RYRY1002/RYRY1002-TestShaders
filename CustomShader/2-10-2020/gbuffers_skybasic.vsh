#version 120

varying vec3 color;

void main() {
  gl_Position = ftransform();
  tintColor = gl_Color.rgb;
}
