shader_type canvas_item;
render_mode skip_vertex_transform;

void vertex() {
    VERTEX = (EXTRA_MATRIX * (WORLD_MATRIX * vec4(VERTEX, 0.0, 1.0))).xy;
	//VERTEX.y += VERTEX.x-512.0;
    // VERTEX.y += VERTEX.x;
    float vx = VERTEX.x;
    float radius = 4000.0;
    
    float a = 512.0;
    float b = radius;
    float radicand = 0.0 -(a*a) + (2.0*(a)*(vx)) + (radius*radius) - (vx*vx);
    if (radicand > 0.0) {
        VERTEX.y -= b - sqrt(radicand);
    }

} 