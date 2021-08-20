function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: extrage canalul rosu al imaginii
    imgR = img(:, :, 1);

    % TODO: extrage canalul verde al imaginii
    imgG = img(:, :, 2);
    
    % TODO: extrace canalul albastru al imaginii
    imgB = img(:, :, 3);
    
    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    outR = bilinear_rotate(imgR, rotation_angle);
    outG = bilinear_rotate(imgG, rotation_angle);
    outB = bilinear_rotate(imgB, rotation_angle);
    
    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
     out = cat(3, outR, outG, outB);
    
endfunction