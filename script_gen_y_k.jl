#Ceci est un script générant le graph pour un filtre linéaire.
include("y_k methodBRAD/y_k_method3.jl")
include("Traces_experimentales/genA.jl")
include("y_k methodBRAD/display_ovale.jl")
include("y_k methodBRAD/y_k_method_imbrique.jl")
k=20
#----- Creation des propriétés initiales du filtre
n = 10 # taille de nos matrice propriétés du filtre
A = get_matrix_vp_grande(n)
srand(10) # pour poser une graine random pour les tests
b = rand(n,1)
c = rand(1,n)
d=rand()

#----- generation de la reponse du filtre -----
h = zeros(k)
h[1] = d
A_puissance = eye(n) # optimisation des calculs
for i in 2:k
  h[i] += abs((c*A_puissance*b)[1])
  A_puissance *= A
end
#----------------------------------------------
s = 0
for i in k+1:10000
  s += abs((c*A_puissance*b)[1])
  A_puissance *= A
end
#---------------------
pas = 1
x = collect(-sum(h):pas:sum(h))
print("Temps execution methode non imbriqué : ")
tic()
y = y_k_method3(x,h)
toc()
print("Temps execution methode non imbriqué : ")
tic()
y = y_k_method_imbrique(x,h)
toc()
using PyPlot

plot(x,y)
#display_ovale(h,A,b,c,s)
