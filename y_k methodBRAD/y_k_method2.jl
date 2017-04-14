
# fonction qui prend en argument un vecteur x donné, un rang k et renvoie la distribution de y_k
include("matrice_eps.jl")
include("somme_eps.jl")
include("produit.jl")

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
h= [1,2]
x=collect(-3:0.1:3)
y = y_k_method2(x,h)
print("Finished")
using PyPlot
plot(x,y)
=#
