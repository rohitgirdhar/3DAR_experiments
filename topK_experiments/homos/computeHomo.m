function [H] = computeHomo(I_path, P_path)

[f1,d1] = readSifts(I_path, 'sifts/sc_full_sifts/');
[f2,d2] = readSifts(P_path, 'sifts/sc_full_sifts/');
[matches, scores] = vl_ubcmatch(d1, d2);

pts1 = zeros(2, size(matches,2));
pts2 = zeros(2, size(matches,2));

for i = 1 : size(matches, 2)
	pts1(:, i) = f1( 1:2,  matches(1, i) );
	pts2(:, i) = f2( 1:2,  matches(2, i) );
end

H = vgg_H_from_x_lin(pts1, pts2);
