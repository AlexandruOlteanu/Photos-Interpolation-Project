function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    
    % obtine dimensiunea imaginii
    [m n nr_colors] = size(I);
    Ix = zeros(m, n);
    Iy = zeros(m, n);
    Ixy = zeros(m, n);
    
    % TODO: fa cast matricii I la double
    I = cast(I, 'double');

    % TODO: calculeaza matricea cu derivate fata de x Ix
    for x = 1 : m
      for y = 2 : n - 1
        Ix(x, y) = fx(I, x, y);
      endfor
    endfor
    
    % TODO: calculeaza matricea cu derivate fata de y Iy
    
    for x = 2 : m - 1
      for y = 1 : n
        Iy(x, y) = fy(I, x, y);
      endfor
    endfor

    % TODO: calculeaza matricea cu derivate fata de xy Ixy 
    
    for x = 2 : m - 1
      for y = 2 : n - 1
        Ixy(x, y) = fxy(I, x, y);
      endfor
    endfor

endfunction
