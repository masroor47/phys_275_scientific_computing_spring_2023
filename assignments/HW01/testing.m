clear


% Testing magnitude of a vector
test1 = [1, 1];
test2 = [3, 4]; 
test3 = [4, 2, 4, 5];

disp(['Magnitude of ', num2str(test1),', |v| = ', num2str(vector_magnitude(test1))]);
% disp(['Magnitude of ', num2str(test2),', |v| = ', num2str(vector_magnitude(test2))]);
% disp(['Magnitude of ', num2str(test3),', |v| = ', num2str(vector_magnitude(test3))]);


% Testing the scalar product
a = [1, 2, 3, 4, 5];
b = [6, 7, 8, 9, 10];

disp(['Scalar product a.b = ', num2str(dot_product(a, b))]);

% Testing matrix by vector
A = [1, 2, 3; 4, 5, 6];
x = [1; 3; 5];

disp('Ax = ');
disp(matrix_by_vector(A, x));

% Testing the matrix multiplication
A = [1, 2, 3; 4, 5, 6];
B = [1, 2; 3, 4; 5, 6];

disp('matrix mult AB = ');
disp(matrix_mult(A, B));