include("vecteur_eps2.jl")
function gen_T(h_list,n)
  combin=matrice_eps2(n)
  incomplet = 0
  T = [Array{Float64}(2^n) for idx in 1:div(length(h_list)-1,n)+1]
  for j in 1:div(length(h_list)-1,n)+1
    if (n*j>length(h_list))
      combin = matrice_eps2(length(h_list[n*(j-1)+1:end]))
      incomplet = 1
    end
    for i in 1:2^n
      if incomplet==1
        T[j][i]= (size(combin,1)>=i)?sum_kbn(combin[i,:].*h_list[n*(j-1)+1:end]):0
      else
        T[j][i]= sum_kbn(combin[i,:].*h_list[n*(j-1)+1:n*j])
      end
    end
  end
  return T
end
