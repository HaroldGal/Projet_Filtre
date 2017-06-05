#Cette application permet de verifier nos calculs analytiques en matlab. elle effectue un nombre N de tirages aléatoires et affiche leur repartition après être passé k fois dans un filtre caractérisé par des matrices A b c et d


+function script()
+N = 1000000; %nombre de calculs pour notre probabilité
+
+% initialisation de nos constantes
+n=10;
+A = get_matrix_vp_grande(n);
+b = rand(n,1);
+c = rand(1,n);
+d=1;
+% quel k ?
+k = 1;
+
+y_values = [];
+
+for i=1:N % debut de notre tirage aléatoire
+  u= zeros(k+1,1);
+  for j=1:k+1
+    u(j)= rand_uniform(-1, 1);
+  end
+  y_k = get_y_k(u,A,b,c,d,k);
+  y_values(i) = y_k;
+end
+
+histogram(y_values)
+end
+
+
+function res = rand_uniform(a, b)
+    res = a + rand()*(b - a);
+end
+
+function res2 = get_matrix_vp_grande(n)
+  %renvoie une matrice carrée n inversible avec des valeurs propres proches de 1
+  matrixDiagVP = eye(n);
+  B = rand_uniform(0.9, 1); % liste de n rand entre 0.9 et 1
+  matrixDiagVP = matrixDiagVP.*B; % multiplication membre par membre de matrice
+  P = rand(n,n);
+  res2 = P*matrixDiagVP*inv(P);
+end
+
+function y_k=get_y_k(u, A, b, c, d, k)
+  y_k=0 ;
+  n = size(A,1);
+  x_k = zeros(n,1);
+  for i=0:k
+    y_k = (c*x_k + d*u(i+1));
+    x_k = A*x_k + b*u(i+1) ;
+  end
+
+end
