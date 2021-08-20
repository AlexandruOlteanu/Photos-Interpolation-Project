function out = nn_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % TODO: extrage canalul rosu al imaginii
    imgR = img(:, :, 1);

    % TODO: extrage canalul verde al imaginii
    imgG = img(:, :, 2);

    % TODO: extrace canalul albastru al imaginii
    imgB = img(:, :, 3);

    % TODO: aplica functia nn pe cele 3 canale ale imaginii
    outR = nn_resize(imgR, p, q);
    outG = nn_resize(imgG, p, q);
    outB = nn_resize(imgB, p, q);

    % TODO: formeaza imaginea finala cu cele 3 canale de culori
    % Hint: functia cat
    out = cat(3, outR, outG, outB);

endfunction
