function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================
    r = (f(x, y + 1) - f(x, y - 1))/2;
    % TODO: calculeaza derivata

endfunction