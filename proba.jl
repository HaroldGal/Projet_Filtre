include("genY.jl")


N = 10000 # nombre de calculs pour notre probabilite

# initialisation de nos constantes
n=10
A = get_matrix_vp_grande(n)
b = rand(n,1)
c = rand(1,n)
d=1

# quel k ?
k = 1
pas = 0.1 # 21 nombres de points de notre fonction  (2/0.1+1)
d_max=d
d_max = d+(c*b)[1]
d_max = round(d_max*10)/10
#y_k_values = collect(-d_max:pas:d_max) #borne à définir
#y_k_values_stock = zeros(length(y_k_values))
y_k_values_dict = Dict()
# init
for i in -d_max:pas:d_max
  y_k_values_dict[i] = 0
end

# initialisation de nos constantes
n=10
A = get_matrix_vp_grande(n)
b = rand(n,1)
c = rand(1,n)
for i=1:N
  u=zeros(k+1) # init u
  for j=1:k+1 # creation de notre signal u random entre -1 et 1
    u[j]=rand(-d_max*10000:d_max*10000)/10000
  end
 y_k = get_y_non_uniforme(u, A, b, c, d, k)
 y_round = round(Int,y_k*1/pas)/10 # arrondi notre y_k au pas pret
 y_k_values_dict[y_round] += 1
 """
 if y_k > 0
   indice_arrondi_y_k = round(Int,1/pas + 1 + y_k*1/pas)
   println(indice_arrondi_y_k)
 else
   indice_arrondi_y_k = round(Int, 1/pas + 1/pas*y_k + 1)
   println(indice_arrondi_y_k)
 end
 """
 #println(indice_arrondi_y_k)
 #y_k_values_stock[indice_arrondi_y_k] = y_k_values_stock[indice_arrondi_y_k] + 1
end
#y_k_values_stock = y_k_values_stock/N
y_k_values = [i for i in collect(keys(y_k_values_dict))]
y_k_values = sort(y_k_values)
y_k_values_stock = [y_k_values_dict[i] for i in y_k_values]/N
println("Done")
