shader_type canvas_item;
render_mode skip_vertex_transform;

void vertex() {
    VERTEX = (EXTRA_MATRIX * (WORLD_MATRIX * vec4(VERTEX, 0.0, 1.0))).xy;
	//VERTEX.y += VERTEX.x-512.0;
    // VERTEX.y += VERTEX.x;
    float vx = VERTEX.x;
    float radius = 2000.0;
    //VERTEX.y += -0.001*((vx-512.0)*(vx-512.0))+64.0;
    // VERTEX.y += sqrt(10.0 - exp2(vx));
    // VERTEX.y += -sqrt(pow(radius,2.0) - pow(vx,2.0));
    // if ((radius*radius) > (vx*vx)){
    //     VERTEX.y += -sqrt(((radius)*(radius) - (vx)*(vx)));
    // }
    // else{
    //     VERTEX.y += 0.0;
    // }
    float a = 512.0;
    float b = radius;
    float radicand = 0.0 -(a*a) + (2.0*(a)*(vx)) + (radius*radius) - (vx*vx);
    if (radicand > 0.0) {
        VERTEX.y -= b - sqrt(radicand);
    }
        // VERTEX.y += sqrt(10.0*10.0-100.0);
    //VERTEX.y += 0.0;
    //VERTEX.y += ((VERTEX.x)*(VERTEX.x))-512.0;
    //VERTEX.y -= 512.0;
} 