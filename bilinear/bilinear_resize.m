
function R = bilinear_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare biliniara
    % Transforma imaginea I alb-negru din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % initializeaza matricea finala
    R = zeros(p, q);
    
    
    % TODO: cast I la double
    I = cast(I, 'double');
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif
    p = p - 1;
    q = q - 1;
    n = n - 1;
    m = m - 1;

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!


    % TODO: calculeaza factorii de scalare
    s_x = q / n; s_y = p / m;
    m = m + 1;
    n = n + 1;
    
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n

    % TODO: defineste matricea de transformare pentru redimensionare
    T = [s_x, 0; 0, s_y];
    % TODO: calculeaza inversa transformarii
    Ti = T^(-1);
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p
        for x = 0 : q;
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            xy = [x; y];
            xy = Ti * xy;
            % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_curent = xy(1, 1) + 1;
            y_curent = xy(2, 1) + 1;
            
            % TODO: afla punctele ce inconjoara punctul (xp, yp)
            points = surrounding_points(n, m, x_curent, y_curent);
            x1 = points(1, 1); y1 = points(1, 2);
            x2 = points(1, 3); y2 = points(1, 4);
            
            % TODO: calculeaza coeficientii de interpolare a
            a = bilinear_coef(I, x1, y1, x2, y2);
            
            % TODO: calculeaza valoarea interpolata a pixelului (x, y)
            R(y + 1, x + 1) = a(1, 1) + a(2, 1) * x_curent + a(3, 1) * y_curent + a(4, 1) * x_curent * y_curent;
            
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
       
        endfor
    endfor

    % TODO: transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);
    
endfunction
