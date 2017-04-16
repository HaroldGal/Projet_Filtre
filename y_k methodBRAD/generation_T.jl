#include("y_k methodBRAD/matrice_eps.jl")
function gen_T(h_list,n)
  combin=matrice_eps(n)
  T = [Array{Float64}(2^n) for idx in 1:div(length(h_list)-1,n)+1]
  for j in 1:div(length(h_list)-1,n)+1
    for i in 1:2^n
      T[j][i]=sum_kbn(combin[i,:].*h_list[n*(j-1)+1:n*j])
    end
  end
  return T
end
h=ones(16)
A = gen_T(h,4)
