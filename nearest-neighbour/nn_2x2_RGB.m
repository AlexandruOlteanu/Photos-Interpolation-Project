function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB.
    % =========================================================================
    
    % TODO: extrage canalul rosu al imaginii
    imgR = img(:, :, 1);

    % TODO: extrage canalul verde al imaginii
    imgG = img(:, :, 2);
    
    % TODO: extrace canalul albastru al imaginii
    imgB = img(:, :, 3);
    
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    outR = nn_2x2(imgR, STEP);
    outG = nn_2x2(imgG, STEP);
    outB = nn_2x2(imgB, STEP);
    
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
     out = cat(3, outR, outG, outB);

endfunction
