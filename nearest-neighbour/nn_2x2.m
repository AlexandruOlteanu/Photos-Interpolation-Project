function out = nn_2x2(f , STEP)
    % =========================================================================
    % Aplica interpolare nearest-neighbour pe imaginea 2x2 f cu puncte
    % intermediare echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================
    
    % TODO: defineste coordonatele x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    % afla nr. de puncte
    n = length(x_int);

    % cele 4 punctele incadratoare vor fi aceleasi pentru toate punctele din
    % interior
    x1 = y1 = 1;
    x2 = y2 = 2;
    out = zeros(n, n);

    % TODO: initializeaza rezultatul cu o matrice n x n plina de zero

    % parcurge fiecare pixel din imaginea finala
    for i = 1 : n
        for j = 1 : n
            % TODO: afla cel mai apropiat pixel din imaginea initiala
            x_curent = x_int(i);
            y_curent = y_int(j);
            dist = 10000;
            if (x_curent - x2) * (x_curent - x2) + (y_curent - y2) * (y_curent - y2) < dist
              dist = (x_curent - x2) * (x_curent - x2) + (y_curent - y2) * (y_curent - y2);
              out(i, j) = f(x2, y2);
            endif
            if (x_curent - x2) * (x_curent - x2) + (y_curent - y1) * (y_curent - y1) < dist
              dist = (x_curent - x2) * (x_curent - x2) + (y_curent - y1) * (y_curent - y1);
              out(i, j) = f(x2, y1);
            endif
            if (x_curent - x1) * (x_curent - x1) + (y_curent - y2) * (y_curent - y2) < dist
              dist = (x_curent - x1) * (x_curent - x1) + (y_curent - y2) * (y_curent - y2);
              out(i, j) = f(x1, y2);
            endif
            if (x_curent - x1) * (x_curent - x1) + (y_curent - y1) * (y_curent - y1) < dist
              dist = (x_curent - x1) * (x_curent - x1) + (y_curent - y1) * (y_curent - y1);
              out(i, j) = f(x1, y1);
            endif
        endfor
    endfor

endfunction
