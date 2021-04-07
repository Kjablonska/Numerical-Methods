function[eigenvalues] = QR_shifts(A)

tol = 10e-6;
imax = 10000;
iterations = 0;
n = size(A,1);

eigenvalues=diag(ones(n));
init_subm = A;

for k=n:-1:2
    DK = init_subm;
    it = 0;
    
    while it <= imax && max(abs(DK(k, 1:k-1))) > tol
        DD = DK(k-1:k, k-1:k);
        p = [1 -(DD(1,1) + DD(2,2)) DD(2,2)*DD(1,1)-DD(2,1)*DD(1,2)];
        e = roots(p);
        
        if abs(e(1) - DD(2,2)) < abs(e(2) - DD(2,2))
            shift = e(1);
        else
            shift = e(2);
        end
        DP = DK - eye(k) * shift ;
        [Q, R] = QR(DP);
        DK = R * Q + eye(k) * shift;
        it = it + 1;
    end
    if it > imax
        error ('imax exceeded, can not proceed.');
    end
    eigenvalues(k) = DK(k,k);
    
    if k > 2
        init_subm = DK(1:k-1, 1:k-1);
    else
        eigenvalues(1) = DK(1,1);
    end
    iterations = iterations + 1;
    
end

disp('QR method for finding eigenvalues with shifts');
disp('Final matrix');
disp(A);
disp('Number of iterations');
disp(iterations);




