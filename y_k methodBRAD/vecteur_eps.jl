#va génerer une matrice epsilon avec toutes les combinaisons possible de -1 et de 1 pour un k donné
function matrice_eps(k)
  n=2^k
  m = zeros(n,k)
  for i in 0:n-1
    #on binarise notre nombre
    binarise=bin(i,k)
    #on transforme notre nombre binarise en liste de caractere
    caractere=collect(binarise)
    print(caractere[1])
    for j in 1:k
      if caractere[j]=='1'
        
          m[i+1,j]=1

      else
          m[i+1,j]=-1
      end
    end
  end

  return m
end
f=matrice_eps(2)
print(f)
