shader_type canvas_item;

uniform float speed : hint_range(0.0, 5.0) = 0.5;
uniform float star_density : hint_range(0.0, 1.0) = 0.02;
uniform float star_size : hint_range(0.0, 0.01) = 0.002;
uniform vec4 star_color : source_color = vec4(1.0);
uniform vec4 bg_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);

float rand(vec2 co) {
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = UV;

    // Scroll UV vertically over time
    float scrolled_y = fract(uv.y - TIME * speed);
    vec2 scrolled_uv = vec2(uv.x, scrolled_y);

    // Divide screen into a grid of cells
    float grid_size = 50.0;
    vec2 cell = floor(scrolled_uv * grid_size);
    vec2 cell_uv = fract(scrolled_uv * grid_size);

    // Place a star randomly within each cell
    float r = rand(cell);
    vec2 star_pos = vec2(rand(cell + 0.1), rand(cell + 0.2));

    // Draw the star as a small circle
    float dist = length(cell_uv - star_pos);
    float star = step(dist, star_size * grid_size);

    // Only show star if random value is below density threshold
    star *= step(star_density, r) < 0.0 ? 0.0 : step(r, star_density);

    COLOR = mix(bg_color, star_color, star);
}