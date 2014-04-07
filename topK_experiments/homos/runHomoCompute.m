function runHomoCompute(img_idx)
OUTPUT_DIR = '/Pulsar3/rohit.girdhar/topK_experiments/homos/all_results/results_bob/';
IMAGES_DIR = 'Images_bob/';
OUTF = strcat(OUTPUT_DIR, 'homo_', int2str(img_idx), '.txt');
delete(OUTF);
N = 285;
I = imread(strcat(IMAGES_DIR, sprintf('%08d', img_idx), '.jpg'));
for j = 0 : N-1
	P = imread(strcat(IMAGES_DIR, sprintf('%08d', j), '.jpg'));
	H = computeHomo(I, P);
	f = fopen(OUTF, 'a');
	for row = 1 : 3
		fprintf(f, '%f %f %f\n', H(row, 1), H(row, 2), H(row, 3));
	end
	fclose(f);
	disp(sprintf('Done for %d -> %d', img_idx, j));
end



