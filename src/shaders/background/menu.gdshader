shader_type canvas_item;

// Controles del efecto de onda
uniform float wave_speed = 2.0;
uniform float wave_frequency = 5.0;
uniform float wave_amplitude = 0.1;
uniform vec2 wave_direction = vec2(1.0, 0.0);

// Colores del gradiente
uniform vec4 color1 : source_color = vec4(0.1, 0.3, 0.7, 1.0);
uniform vec4 color2 : source_color = vec4(0.7, 0.1, 0.3, 1.0);

void fragment() {
    // Crea un efecto de onda
    float wave = sin(UV.x * wave_frequency + TIME * wave_speed) * wave_amplitude;
    
    // Aplica la onda a las coordenadas UV
    vec2 wave_uv = UV + wave_direction * wave;
    
    // Crea el gradiente con efecto de onda
    float gradient_value = fract(wave_uv.x + wave_uv.y * 0.5);
    
    // Opcional: añade más complejidad al gradiente
    gradient_value = sin(gradient_value * 3.14159 * 2.0) * 0.5 + 0.5;
    
    COLOR = mix(color1, color2, gradient_value);
}