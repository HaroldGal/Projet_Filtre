include("genA.jl")
function get_y_non_uniforme(u, A, b, c, d, k)
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
  return y[k+1]
end

function get_y_k(u, A, b, c, d, k)
  #renvoie une matrice Y en fonction des constantes du filtre
  y_k = 0 # on doit definir au cas ou
  n = size(A,1)
  x_k = zeros(n)
  for i in 0:k
    y_k = (c*x_k + d*u[i+1])[1]
    x_k = A*x_k + b*u[i+1] #il faut définir x_0
  end
  return y_k
end

function rand_uniform(a, b)
    a + rand()*(b - a)
end
