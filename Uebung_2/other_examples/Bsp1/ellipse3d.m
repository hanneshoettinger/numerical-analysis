function result = ellipse3d(phi, a, b, M, u, v)
    result = M + ((a * cos(phi)) * u) + ((b * sin(phi)) * v);
end

