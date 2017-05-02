
# fonction qui prend en argument un vecteur x donné, un rang k et renvoie la distribution de y_k
include("matrice_eps.jl")
include("produit.jl")

function somme_eps(h,k,vecteur_eps)
  sum=0
  #renvoie la somme de 1 à k de la mutiplication entre h(j) et eps(j)
  for j in 1:k
    sum=sum+vecteur_eps[j]*h[j]

  end

  return sum

end

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

function y_k_method2(x,h)
  k = length(h)
  n=length(x)
  y=zeros(n)
  # on va commencer par initialiser la matrice qui va contenir nos epsilon pour les combinaisons de -1 et 1 et on va itérer à partir de ça
  matrice=matrice_eps(k)
    sum=zeros(n) # on reinitalise la somme pour chaque x[i]
    for m in 1:2^k # on  parcourt toutes les combinaison de -1 et 1
      vecteur_eps=matrice[m,:] # on recupere une combinaison dans la matrice
      someps=somme_eps(h,k,vecteur_eps) # on utilise la fonction somme_eps pour faire la somme des element  du vecteur avec le h corespondant
      sum=sum+((x+someps).^(k-1)).*sign(x+someps).*produit(vecteur_eps) #on realise l'opération principale
    end
  y=sum/(2^(k+1)*produit(h)*factorial(k-1)) # on divise

  return y # on renvoie le vecteur y
end

#=
h= ones(16)
x=collect(-3:0.1:3)
y = y_k_method2(x,h)
print("Finished")
using PyPlot
plot(x,y)
=#
