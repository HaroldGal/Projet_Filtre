#Ici on renverra seulement le scalaire y(k)
function get_y_k(A, b, c, d,k)
  #renvoie une matrice Y en fonction des constantes du filtre
  n = size(A,1)
  u_0 = 0.5
  y_0=d*u_0
  y_k=y_0
  x_0 = zeros(n,1)
  x_k = x_0
  u_k = u_0
  for i=1:k
    y_k = c*x_k + d*u_k
    x_k = A*x_k + b*u_k #il faut définir x_0
  end
  return y_k
end

function get_y_uniforme(A, b, c, d, k)
  #renvoie une matrice Y en fonction des constantes du filtre
  u = 0.5
  y_k=d*u
  for i=1:k
    y_k += (c*A^(i-1)*b)[1]*u
  end
  return y_k
end

function get_y_non_uniforme(u, A, b, c, d)
  #renvoie une matrice Y en fonction des constantes du filtre
  n = length(u)
  y = zeros(n)
  y[1]=d*u[1]
  for i=1:(n-1)
    y[i+1] = d*u[i+1]
    for j=1:i
      y[i+1] += ((c*A^(j-1)*b)*u[i-j+1])[1]
    end
  end
  return y
end
