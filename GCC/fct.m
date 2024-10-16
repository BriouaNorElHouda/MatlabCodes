
clc;
N = 100;
M = 200;
a = zeros(N,1);
tic; % serial (regular) for-loop
for i = 1:N
 a(i) = max(eig(rand(M)));
end
toc;
tic; % parallel for-loop
parfor i = 1:N
 a(i) = max(eig(rand(M)));
end
toc;
matlabpool close
