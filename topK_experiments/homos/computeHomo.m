function [H] = computeHomo(I, P)
run('/home.temp/rohit.girdhar/utils/vlfeat-0.9.14/toolbox/vl_setup.m')
addpath('/home.temp/rohit.girdhar/utils/vgg/vgg_multiview/')

[f1,d1] = vl_sift(single(rgb2gray(I)));
[f2,d2] = vl_sift(single(rgb2gray(P)));
[matches, scores] = vl_ubcmatch(d1, d2);

pts1 = zeros(2, size(matches,2));
pts2 = zeros(2, size(matches,2));

for i = 1 : size(matches, 2)
	pts1(:, i) = f1( 1:2,  matches(1, i) );
	pts2(:, i) = f2( 1:2,  matches(2, i) );
end

H = vgg_H_from_x_lin(pts1, pts2);
