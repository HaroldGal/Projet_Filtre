
# fonction qui prend en argument un vecteur x donné, un rang k et renvoie la distribution de y_k
include("somme_eps.jl")
include("produit.jl")
include("generation_T.jl")

function display_ovale(h,A,B,C)
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
    M+=(abs(R[i])/(1-abs(decomp[:values][i])))*(abs(decomp[:values][i])/maximum(decomp[:values]))
  end
  a = maximum(decomp[:values])^(k+1)*M
  curser = 4
  T = gen_T(h,curser)
  k = length(h)
  b = 0.02
  for m in 0:2^k-1 # on  parcourt toutes les combinaison de -1 et 2^k
    someps=0
    for i in 1:length(T)
        someps = someps + T[i][((m>>(4*(i-1)))&15)+1] # on trouve le point (h1+h2+...+hn, h1-h2+h3+...+hn etc)
      end
      plot(a*cos(t)-someps,b*sin(t)) #on affiche le ovale autour de ce point
    end

  return y # on renvoie le vecteur y
end
