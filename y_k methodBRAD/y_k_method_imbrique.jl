# fonction qui prend en argument un vecteur x donné, un rang k et renvoie la distribution de y_k
include("produit.jl")
include("generation_T.jl")
function y_k_method_imbrique(x,h)
  curser = 4
  T = gen_T(h,curser)
  k = length(h)
  k_parite = (k%2==0)?0:1
  n=length(x)
  y=zeros(n)
    sum=zeros(n) # on reinitalise la somme pour chaque x[i] # on  parcourt toutes les combinaison de -1 et 2^k
    someps=0
    m=0
      for i in 0:2^16:2^k-1
        someps1=T[5][((i>>(4*(5-1)))&15)+1]
        for j in 0:2^12:2^16-1
          someps2=T[4][((j>>(4*(4-1)))&15)+1]
          for l in 0:2^8:2^12-1
            someps3=T[3][((l>>(4*(3-1)))&15)+1]
            for o in 0:2^4:2^8-1
              someps4=T[2][((o>>(4*(2-1)))&15)+1]
              for  z in 0:1:16-1
                someps5=T[1][((z>>(4*(1-1)))&15)+1]
                someps=someps1+someps2+someps3+someps4+someps5
                sum=sum+((x+someps).^(k-1)).*sign(x+someps).*(((k-count_ones(m))%2==k_parite)?1:-1) #on realise l'opération principale

                m=m+1
              end

                someps=0
              end
            end
          end
        end
  y=sum/(2^(k+1)*produit(h)*factorial(k-1)) # on divise

  return y # on renvoie le vecteur y
end

#=
h= ones(20)
T = gen_T(h,4)
x=collect(-3:0.1:3)
y = y_k_method3(x,h)
print("Finished")
using PyPlot
plot(x,y)
=#
