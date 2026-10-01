// Original shader collected from: https://www.shadertoy.com/view/WsVSzV
// Licensed under Shadertoy's default (CC BY NC SA 3.0)
// Modificado para estilo Tony Stark / Iron Man HUD (naranja-rojo dorado)

float warp = 0.05; // curvatura de la pantalla (estilo CRT retro-futurista)
float scan = 0.25; // intensidad de las scanlines (un poco más suave para look high-tech)

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // distancia al centro (para warp)
    vec2 uv = fragCoord / iResolution.xy;
    vec2 dc = abs(0.5 - uv);
    dc *= dc;
    
    // aplicar warp estilo monitor curvo
    uv.x -= 0.5; uv.x *= 1.0 + (dc.y * (0.3 * warp)); uv.x += 0.5;
    uv.y -= 0.5; uv.y *= 1.0 + (dc.x * (0.4 * warp)); uv.y += 0.5;

    // si está fuera de los bordes → negro puro (efecto de pantalla)
    if (uv.y > 1.0 || uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0)
        fragColor = vec4(0.0, 0.0, 0.0, 1.0);
    else
    {
        // scanlines
        float apply = abs(sin(fragCoord.y) * 0.5 * scan);
        
        // samplear la textura original
        
        // Otras opciones (descomenta la que te guste):
        vec3 hudTint = vec3(0.1, 1.0, 0.75);   // cyan-verde más equilibrado
        // vec3 hudTint = vec3(0.05, 1.0, 0.45);  // verde neón intenso (estilo Matrix)
        // vec3 hudTint = vec3(0.2, 0.95, 0.9);   // turquesa suave      
        // TINTE TONY STARK: naranja-rojo dorado 🔥
        // vec3 starkTint = vec3(1.0, 0.48, 0.12); // naranja-dorado intenso (repulsores + HUD)
        
        // mezcla con scanlines (más oscuro entre líneas)
        fragColor = vec4(mix(color * starkTint, vec3(0.0), apply), 1.0);
    }
}
