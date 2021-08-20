function points = surrounding_points(n, m, x, y)
    % =========================================================================
    % Calculeaza cele 4 puncte ce contin in interior (x, y)
    % Primeste si dimensiunea unei imagini m x n, pentru a asigura ca nu se
    % iese din matrice.
    % =========================================================================
    
    % TODO: Calculeaza x1, y1, x2, y2
    points = [0, 0, 0, 0];
    points(1, 1) = floor(x);
    points(1, 3) = points(1, 1) + 1;
    if points(1, 3) > n
       points(1, 3) = n - 1;
    endif
    points(1, 2) = floor(y);
    points(1, 4) = points(1, 2) + 1;
    if points(1, 4) > m
       points(1, 4) = m - 1;
    endif 

endfunction