#va génerer une matrice epsilon avec toutes les combinaisons possible de -1 et de 1 pour un k donné
function matrice_eps(k)
  n=2^k
  m = zeros(n,k)
  for i in 0:n-1
    #on binarise notre nombre pour retrouver les combinaisons
    binarise=bin(i,k)
    #on transforme notre nombre binarise en une liste de caractere
    caractere=collect(binarise)
    #on parcourt la liste de caractere et si on a un 1 on le garde mais en version entiere et si 0 on le transformeen -1
    for j in 1:k
      if caractere[j]=='1'
          m[i+1,j]=1

      else
          m[i+1,j]=-1
      end
    end
  end
#on renvoit notre matrice ds combinaises d'epsilon
  return m
end
