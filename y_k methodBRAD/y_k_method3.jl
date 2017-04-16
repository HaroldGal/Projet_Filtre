
# fonction qui prend en argument un vecteur x donné, un rang k et renvoie la distribution de y_k
include("matrice_eps.jl")
include("somme_eps.jl")
include("produit.jl")
include("generation_T.jl")

function y_k_method3(x,h)
  curser = 4
  T = gen_T(h,curser)
  k = length(h)
  n=length(x)
  y=zeros(n)
    sum=zeros(n) # on reinitalise la somme pour chaque x[i]
    for m in 1:2^k # on  parcourt toutes les combinaison de -1 et 2^k
      someps=0
      for i in 1:length(T)-1
        someps = someps + T[i][((m>>(i-1))&15)+1]
      end
      sum=sum+((x+someps).^(k-1)).*sign(x+someps).*((count_ones(m)%2==0)?1:-1) #on realise l'opération principale
    end
  y=sum/(2^(k+1)*produit(h)*factorial(k-1)) # on divise

  return y # on renvoie le vecteur y
end

h= ones(16)
x=collect(-3:0.1:3)
y = y_k_method3(x,h)
print("Finished")
using PyPlot
plot(x,y)
