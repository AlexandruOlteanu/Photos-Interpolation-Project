
function R = nn_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare nearest-neighbour
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % ignora imagini care nu sunt alb negru
    if nr_colors > 1
        R = -1;
        return
    endif
    % TODO: cast I la double
    I = cast(I, 'double');
    % initializeaza matricea finala
    R = zeros(p, q);
    p = p - 1;
    q = q - 1;
    n = n - 1;
    m = m - 1;
    %disp('Alex');disp(n);disp(m);
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
        for x = 0 : q
             % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            xy = [x; y];
            xy = Ti * xy;
            % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_curent = xy(1, 1) + 1;
            y_curent = xy(2, 1) + 1;
            % TODO: calculeaza cel mai apropiat vecin
            x1 = floor(x_curent);
            x2 = ceil(x_curent);
            if x2 > n
              x2 = n;
            endif
            y1 = floor(y_curent);
            y2 = ceil(y_curent);
            if y2 > m
              y2 = m;
            endif
            dist = 1000000000;
            if (x_curent - x2) * (x_curent - x2) + (y_curent - y2) * (y_curent - y2) < dist
              dist = (x_curent - x2) * (x_curent - x2) + (y_curent - y2) * (y_curent - y2);
              R(y + 1, x + 1) = I(y2, x2);
            endif
            if (x_curent - x2) * (x_curent - x2) + (y_curent - y1) * (y_curent - y1) < dist
              dist = (x_curent - x2) * (x_curent - x2) + (y_curent - y1) * (y_curent - y1);
              R(y + 1, x + 1) = I(y1, x2);
            endif
            if (x_curent - x1) * (x_curent - x1) + (y_curent - y2) * (y_curent - y2) < dist
              dist = (x_curent - x1) * (x_curent - x1) + (y_curent - y2) * (y_curent - y2);
              R(y + 1, x + 1) = I(y2, x1);
            endif
            if (x_curent - x1) * (x_curent - x1) + (y_curent - y1) * (y_curent - y1) < dist
              dist = (x_curent - x1) * (x_curent - x1) + (y_curent - y1) * (y_curent - y1);
              R(y + 1, x + 1) = I(y1, x1);
            endif
            % TODO: calculeaza valoarea pixelului din imaginea finala
        endfor
    endfor

    % TODO: converteste matricea rezultat la uint8
    R = uint8(R);

endfunction
