#va génerer une matrice epsilon avec toutes les combinaisons possible de -1 et de 1 pour un k donné
function matrice_eps2(k)
  n=2^k
  m = zeros(n,k)
  for i in 0:n-1
    for j in 0:k-1
      if ((i>>(j))&1)==0
        m[i+1,j+1]=1
      else
        m[i+1,j+1]=-1
    end
  end
  end

  return m
end

a = matrice_eps2(3)
