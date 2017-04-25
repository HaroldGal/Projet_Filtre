function y_k2(x,h0,h1,h2)

	y=zeros(length(x))
	i=1

	while(i<=h0+h1+h2)

		#cas 1 sous cas 1
		while (-h0-h1-h2 <= x[i] < min(-h0-h1+h2,-h0+h1+h2))
			y[i]=x[i]^2/(8*h0*h1) + x[i]*((3*h0+3*h1+2*h2)/(8h_0*h1))+((3*h0^2+3*h1^2+h2^2+6*h0*h1+4*h1*h2+4h0*h2)/(8*h0*h1))
			i=i+1
		  end
		
		#cas 1 sous cas 2
		while(-h0-h1+h2 <= x[i] < h1-h0-h2)
      		y[i] = (h2^2+h2*h0+h2*h1)/(2*h0*h1)
			i=i+1
		end

		#cas 1 sous cas 3
		while(-h0+h1-h2 <= x[i] < -h0-h1+h2)
			y[i] = (2*h1^2+h1*h0)/(2*h0*h1)
			i = i + 1
		end
	
		#cas 1 sous cas 4
        while(-h0-h1+h2 <= x[i] < min(-h0+h1+h2,-h0+h1-h2))
        	y[i] = x[i]^2/(8*h0*h1) + x[i]*(-4*h1-2*h2)/(8*h0*h1)+(-h0^2+3*h1^2+h2^2-2*h0*h1+2*h1*h2-2*h0*h2)/(8*h0*h1)
        	i=i+1
        end

        #cas 2 sous cas 1
        while(h0-h1-h2 <= x[i] < -h0-h1+h2)
        	y[i] = (2*h0^2+h1*h0)/(2*h1*h0)
        	i=i+1
        end

        #cas 2 sous cas 2
        while(max(h0-h1-h2,-h0-h1+h2) <= x[i] < h0-h1+h2)
        	y[i] = (x[i]^2)/(8*h0*h1) + x[i]*(-4*h0-2*h2)/(8*h0*h1)+(2*h0^2-h1^2+h2^2-2*h0*h1+4*h0*h2)/(8*h0*h1)
        	i=i+1
        end

        #cas 3 sous cas 1
        while(-h0+h1-h2 <= x[i] < min(h0-h1-h2,-h0+h1+h2))
        	y[i] = x[i]/(2*h0) + (h0-h1+h2)/(2*h0)
        	i=i+1
        end

        #cas 3 sous cas 2
        while(-h0+h1+h2 <= x[i] < h0-h1-h2)
        	y[i] = h2/h0
        	i=i+1
        end

        #cas 3 sous cas 3
        while((h0-h1-h2 <= x[i] < -h0+h1+h2) && (h0-h1 > -h0+h1))
        	y[i] = (h0-h1)/(h0)
        	i=i+1
        end

        #cas 3 sous cas 4
        while(max(h0-h1-h2,-h0+h1+h2) <= x[i] < h0-h1+h2)
        	y[i] = -x[i]/(2*h0) + (h0-h1+h2)/(2*h0)
        	i=i+1
        end

        #cas 4 sous cas 1
        while(h0-h1-h2 <= x[i] < min(-h0+h1-h2,h0-h1+h2))
        	y[i] = x[i]/(2*h1) + (-h0+h1+h2)/(2*h1)
        	i=i+1
        end

        #cas 4 sous cas 2
        while(h0-h1+h2 <= x[i] < -h0+h1-h2)
        	y[i] = h2/h1
        	i=i+1
        end

        #cas 4 sous cas 3
        while((-h0+h1-h2 <= x[i] < h0-h1+h2) && (h0-h1 < -h0+h1))
        	y[i] = (h1-h0)/h1
        	i=i+1
        end

        #cas 4 sous cas 4
        while(max(-h0+h1-h2,h0-h1+h2) <= x[i] < -h0+h1+h2)
        	y[i] = -x[i]/(2*h1) + (-h0+h1+h2)/(2*h1)
        	i=i+1
        end

        #cas 5 sous cas 1
        while(h0+h1-h2 <= x[i] < -h0+h1+h2)
        	y[i] = 1/2
        	i=i+1
        end

        #cas 5 sous cas 2
        while(max(h0+h1-h2,-h0+h1+h2) <= x[i] <= h0+h1+h2)
        	y[i] = -x[i]^2/(8*h0*h1) + x[i]*h2/(4*h0*h1) + (h0^2+h1^2-h2^2+2*h0*h1)/(8*h0*h1) 
        	i=i+1
        end

        #cas 5 sous cas 3
        while(-h0+h1-h2 <= x[i] < min(-h0+h1+h2,h0+h1-h2))
        	y[i] =  -x[i]^2/(8*h0*h1) + x[i]*(2*h1-h2)/(4*h0*h1)+ (h0^2-h1^2-h2^2+2*h0*h1+4*h1*h2)/(8*h0*h1)
        	i=i+1
        end

        #cas 5 sous cas 4
        while(h0+h1+h2 <= x[i] < h0+h1-h2)
        	y[i] = (-h2^2+h0*h2+h1*h2)/(2*h0*h1)
        	i=i+1
        end

        #cas 6 sous cas 1
        while(h0+h1-h2 <= x[i] < h0-h1+h2)
        	y[i]=1/2
        	i=i+1
        end

        #cas 6 sous cas 2
        while(h0-h1-h2 <= x[i] < min(h0-h1+h2,h0+h1-h2))
        	y[i] = -x[i]^2/(8*h0*h1) + x[i]*(2*h0-h2)/(4*h0*h1) + (-3*h0^2+h1^2-h2^2+4*h0*h2+2*h0*h1)/(8*h0*h1)
        	i=i+1
        end

	end

end
