#Ceci est un script générant le graph pour un filtre linéaire.
include("y_k methodBRAD/y_k_method3.jl")
include("Traces_experimentales/genA.jl")
include("y_k methodBRAD/display_oval.jl")
include("y_k methodBRAD/y_k_method_imbrique.jl")
k=3
#----- Creation des propriétés initiales du filtre
n = 10 # taille de nos matrice propriétés du filtre
A = get_matrix_vp_petite(n)
srand(10) # pour poser une graine choisi pour les tests
b = rand(n,1)
c = rand(1,n)
d = rand()

#----- generation de la reponse du filtre -----
h = zeros(k)
h[1] = d
A_puissance = eye(n) # optimisation des calculs
for i in 2:k
  h[i] += abs((c*A_puissance*b)[1])
  A_puissance *= A
end
#----------------------------------------------

s = 0 # Cette partie concerne le reste (affichage des ellipses)
for i in k+1:10000
  s += abs((c*A_puissance*b)[1])
  A_puissance *= A
end

#---------------------
pas = 0.0001
x = collect(-sum(h)-0.5:pas:sum(h)+0.5)
print("Temps execution methode non imbriqué : ")
tic()
y = y_k_method3(x,h) # methode optimisee
toc()
print("Temps execution methode imbriqué : ")
#tic()
#y = y_k_method_imbrique(x,h) # methode optimisee ++
#toc()
using PyPlot
plot(x,y)
#col=(1,1,0) # choisi la couleur des ellipses. format : (r,v,b) avec r,v,b entre 0 et 1
#display_oval(h,A,b,c,s,col) # pour afficher des ellipses ( 2^k ellipses donc choisir un petit k)
