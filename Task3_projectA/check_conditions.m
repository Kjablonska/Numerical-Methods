function check_conditions(A)

% Checking condition number.
cond_nb = norm(inv(A)) * norm(A);
disp('Condition number');
disp(cond_nb);


n = size(A, 1);

% Checking if the diagonal entires of A are nonzero.
if (det(A) == 0)
    disp('Determinant of A equals 0, or very close to 0.');
end

% Checking sufficient convergence conditions.

% Row dominance.
row_dominance = 1;
for i=1:n
    sum = 0;
    for j=1:n
        if j~=i
            sum = sum + abs(A(i,j));
        end
    end
    
    if (~(abs(A(i,i)) > sum))
        row_dominance = 0;
        disp('Row dominance condition not fulfilled.');
        break;
    end
end

if (row_dominance == 1)
    disp('Row dominance condition fulfilled.');
end

% Column dominance.
col_dominance = 1;
for i=1:n
    sum = 0;
    for j=1:n
        if i~=j
            sum = sum + abs(A(j,i));
        end
    end
    if (~(abs(A(i,i)) > sum))
        col_dominance = 0;
        disp('Column dominance condition not fulfilled.');
        break;
    end
end
    

if (col_dominance == 1)
    disp('Column dominance condition fullfiled.');
end

if (col_dominance == 1) && (row_dominance == 1)
    disp('All sufficient convergence conditions fulfilled.');
end





    