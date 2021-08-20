function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 img cu puncte intermediare
    % echidistante, cu precizarea ca img este o imagine colorata RGB.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Practic, apeleaza bilinear_2x2_interpolation pe fiecare canal al imaginii
    % img si reconstruieste imaginea colorata la final
    % Parametrii:
    % - img = imaginea 2x2 RGB care doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    imgR = img(:, :, 1);

    % TODO: extrage canalul verde al imaginii
    imgG = img(:, :, 2);
    
    % TODO: extrace canalul albastru al imaginii
    imgB = img(:, :, 3);
    
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    outR = bilinear_2x2(imgR, STEP);
    outG = bilinear_2x2(imgG, STEP);
    outB = bilinear_2x2(imgB, STEP);
    
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
     out = cat(3, outR, outG, outB);

endfunction
