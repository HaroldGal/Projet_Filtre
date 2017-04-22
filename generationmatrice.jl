#coding=utf8
function islessornot(A,b)
n=length(A)
B=falses(A)
for i=1:n
  if (A[i]<b)
      B[i]=true

  else
      B[i]=false
  end
end
return B
end
function random_dSS(n=10, p=1, q=1)
    if n == 23
        n =randint(5, 10)
    end
    # Probability of repeating a previous root.
    #pRepeat = 0.05
    pRepeat = 0.01
    # Probability of choosing a real root.  Note that when choosing a complex
    # root, the conjugate gets chosen as well.  So the expected proportion of
    # real roots is pReal / (pReal + 2 * (1 - pReal)).
    #pReal = 0.6
    pReal = 0.5
    # Probability that an element in B or C will not be masked out.
    pBCmask = 0.8
    #pBCmask = 0.01
    # Probability that an element in D will not be masked out.
    pDmask = 0.3
    # Probability that D = 0.
    pDzero = 0.2

    # Check for valid input arguments.

    # Make some poles for A.  Preallocate a complex array.

    poles = zeros(n) + zeros(n) * 0im
    i = 1

    while i < n

        if rand() < pRepeat && i != 0 && i != n - 1

            # Small chance of copying poles, if we're not at the first or last
            # element.

            if imag(poles[i - 1]) == 0

                poles[i] = poles[i - 1] # Copy previous real pole.
                i += 1

            else

                poles[i:i + 2] = poles[i - 2:i] # Copy previous complex conjugate pair of poles.
                i += 2
             end
        elseif rand() < pReal || i == n - 1

            poles[i] = 2. * rand() - 1. # No-oscillation pole.
            i += 1

        else

            mag = rand() # Complex conjugate pair of oscillating poles.
            phase = 2. * pi * rand()
            poles[i] = complex(mag * cos(phase), mag * sin(phase))
            poles[i + 1] = complex(real(poles[i]), imag(-poles[i]))
            i += 2
        end
    end
    # Now put the poles in A as real blocks on the diagonal.

    A = zeros((n, n))
    i = 1

    while i <= n

        if imag(poles[i]) == 0

            A[i, i] = real(poles[i])
            i += 1

        else

            A[i, i] = A[i + 1, i + 1] = real(poles[i])
            A[i, i + 1] = imag(poles[i])
            A[i + 1, i] = imag(-poles[i])
            i += 2
          end
    end

     # Finally, apply a transformation so that A is not block-diagonal.

    #    T = randn(n, n)


  #    A = dot(solve(T, A), T)  # A = T \ A * T



    # Make the remaining matrices.

    B = randn(n, p)
    C = randn(q, n)
    D = randn(q, p)

    # Make masks to zero out some of the elements.
    Bmask=zeros(n,p)
    Cmask = zeros(q, n)
    Dmask = zeros(q, p)
    while true

        Bmask = islessornot(rand(n, p), pBCmask)
        if any(Bmask,1)[1]==true  # Retry if we get all zeros.
            break
        end
    end
    while true

        Cmask = islessornot(rand(q, n), pBCmask)
        if  any(Cmask,1)[1]==true  # Retry if we get all zeros.
            break
        end
      end
    if rand() < pDzero

        Dmask = zeros((q, p))

    else
        while true

            Dmask = islessornot(rand(q, p),pDmask)

            if any(Dmask,1)[1]==true # Retry if we get all zeros.
                break
            end
        end
     end
    # Apply masks.
println("Prends le deuxième talkie walkie")
    B = B .* Bmask
    C = C .* Cmask
    D = D .* Dmask



return ( Matrix(A), Matrix(B), Matrix(C), Matrix(D))


end

a,b,c,d=random_dSS()
