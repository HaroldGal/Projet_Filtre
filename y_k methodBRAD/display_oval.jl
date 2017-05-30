
# fonction qui prend en argument un vecteur x donné, un rang k et renvoie la distribution de y_k
#include("somme_eps.jl")
include("produit.jl")
include("generation_T.jl")

function display_oval(h,A,B,C,s,col)
  t = linspace(0,2*pi)
  decomp = eigfact(A) # on decompose A. decomp[:valeurs] = vecteurs des vp, decomp[:vectors] = matrice de transition
  n = length(decomp[:values])
  phi = C*decomp[:vectors]
  mu = inv(decomp[:vectors])*B
  R =  zeros(n)
  for i in 1:n
    R[i] = phi[i]*mu[i]
  end
  M = 0
  for i in 1:n
    M+=(abs(R[i])/(1-abs(decomp[:values][i])))*(abs(decomp[:values][i])/maximum(abs(decomp[:values]))) #ATTENTION ICI maximum(abs(decomp[:values])
  end
  k = length(h) #mis ici
  a = maximum(abs(decomp[:values]))^(k+1)*M #ATTENTION ICI maximum(abs(decomp[:values])
  curser = 4
  T = gen_T(h,curser)
  #k = length(h)
  b = 0.01
  verti = 0:0.01:0.2
  for m in 0:2^k-1 # on  parcourt toutes les combinaison de -1 et 2^k
    someps=0
    for i in 1:length(T)
        someps = someps + T[i][((m>>(4*(i-1)))&15)+1] # on trouve le point (h1+h2+...+hn, h1-h2+h3+...+hn etc)
      end
      a = zeros(size(verti))
      plot(s*cos(t)-someps,b*sin(t),color=col) #on affiche le ovale autour de ce point
      #plot(a-someps,verti,color = col)
    end

  return y # on renvoie le vecteur y
end
