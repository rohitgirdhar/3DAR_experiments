function runHomoCompute(img_idx)
OUTPUT_DIR = '/Pulsar3/rohit.girdhar/topK_experiments/homos/all_results/results_sc_full/';
IMAGES_DIR = 'Images_sc_full/';
run('/home.temp/rohit.girdhar/utils/vlfeat-0.9.14/toolbox/vl_setup.m')
addpath('/home.temp/rohit.girdhar/utils/vgg/vgg_multiview/')

OUTF = strcat(OUTPUT_DIR, 'homo_', int2str(img_idx), '.txt');
delete(OUTF);
N = 1505;
I_path = fullfile(IMAGES_DIR, strcat(sprintf('%08d', img_idx), '.jpg'));
for j = 0 : N-1
	P_path = fullfile(IMAGES_DIR, strcat(sprintf('%08d', j), '.jpg'));
	H = computeHomo(I_path, P_path);
	f = fopen(OUTF, 'a');
	for row = 1 : 3
		fprintf(f, '%f %f %f\n', H(row, 1), H(row, 2), H(row, 3));
	end
	fclose(f);
	disp(sprintf('Done for %d -> %d', img_idx, j));
end



