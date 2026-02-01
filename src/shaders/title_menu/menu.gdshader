shader_type canvas_item;

uniform sampler2D pattern_texture;
uniform float pattern_scale = 2.0;
uniform float time_offset = 0.0;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    
    if (tex.a > 0.0) {
        // Coordenadas UV locales para que cada letra tenga el patrón completo
        vec2 local_uv = UV;
        
        // Opcional: añadir variación por tiempo
        vec2 animated_uv = local_uv * pattern_scale + vec2(TIME * 0.0, 0.0);
        
        vec4 pattern = texture(pattern_texture, fract(animated_uv));
        
        // Mantener intensidad del patrón
        float intensity = (pattern.r + pattern.g + pattern.b) / 3.0;
        
        COLOR = vec4(pattern.rgb * intensity, tex.a);
    } else {
        COLOR = vec4(0.0);
    }
}
