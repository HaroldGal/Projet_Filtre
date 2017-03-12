function produit(eps)
prod=1;
#réalise le produit des termes d'un vecteur donné
for i in 1:length(eps)
  prod=prod*eps[i]
end
return prod
end
