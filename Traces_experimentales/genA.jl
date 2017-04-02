
function get_matrix_vp_grande(n)
  #renvoie une matrice carrée n inversible avec des valeurs propres proches de 1
  matrixDiagVP = eye(n)
  B = rand(900:1000,n)/1000 # liste de n rand entre 0.9 et 1
  matrixDiagVP = matrixDiagVP.*B # multiplication membre par membre de matrice
  P = rand(n,n)
  return P*matrixDiagVP*inv(P)
end

function get_matrix_vp_petite(n)
  #renvoie une matrice carrée n inversible avec des valeurs propres proches de 0
  matrixDiagVP = eye(n)
  B = rand(0:100,n)/1000 # liste de n rand entre 0 et 0.1
  matrixDiagVP = matrixDiagVP.*B # multiplication membre par membre de matrice
  P = rand(n,n)
  return P*matrixDiagVP*inv(P)
end

function get_matrix_vp_rand(n)
    #renvoie une matrice carré n inversible avec des valeurs propres aleatoire < 1
    matrixDiagVP = zeros(n,n)
    for i=1:n
      matrixDiagVP[i,i]=rand(1:1000)/1000
    end
    return rand(n,n)*matrixDiagVP
end
