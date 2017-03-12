function somme_eps(h,k,vecteur_eps)
  sum=0
  #renvoie la somme de 1 à k de la mutiplication entre h(j) et eps(j)
  for j in 1:k
    sum=sum+vecteur_eps[j]*h[j]

  end

  return sum

end
