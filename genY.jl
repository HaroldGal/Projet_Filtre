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
