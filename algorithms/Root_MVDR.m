% Federal University of Rio Grande do Norte
% Programa de Pos-Graduacao em Engenharia Eletrica e de Computacao
% Title: Root MVDR (Capon)
% Author: Mário G. F. Figueredo (adapted from R. Moses)
% Description: Root version of MVDR (Capon) Implementation

% x: synthetic or real signal
% P: source numbers
% f: source frequency
% d: distance between the elements

function [result] = Root_MVDR(x, P, f, d, u)

[M,N] = size(x); % M - element number, N - number of samples

% Eigenvalues and eigenvectors
Rx = (x*x')/N; % covariance matrix

RxInv = inv(Rx); % inverse covariance matrix

for kk=1:2*M-1
    a(kk,1)=sum(diag(RxInv,kk-M));
end
ra=roots(a);

% P roots of polynom that are nearest and inside of unity circle
[dum,ind]=sort(abs(ra));
rb=ra(ind(1:M-1));

% P roots nearest of unity circle
[dumm,I]=sort(abs(abs(rb)-1));
w=angle(rb(I(1:P)))';

% doa
dwn = d./(u./f);
result = -asin(w./dwn./pi./2).*180./pi;

end