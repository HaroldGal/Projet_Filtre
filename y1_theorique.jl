using PyPlot

# Ce script plotera  le Y1 theorique pour un certain filtre

function y1(x, h0, h1)
  y = zeros(length(x))
  if -h0+h1<-h1+h0
    for i=1:length(x)
      if x[i] <= -h0-h1 # y = 0, deja init a 0
      elseif x[i] <= h1-h0
        y[i]=(x[i] + h0 + h1)/(4*h0*h1)
      elseif x[i] <= h0-h1
        y[i]=1/(2*h0)
      elseif x[i] <= h0+h1
        y[i]=(-x[i] + h0 + h1)/(4*h0*h1)
      end
    end
  else
    for i=1:length(x)
      if x[i] < -h0-h1 # y = 0, deja init a 0
      elseif x[i] <= h0-h1
        y[i]=(x[i] + h0 + h1)/(4*h0*h1)
      elseif x[i] <= -h0+h1
        y[i]=1/(2*h1)
      elseif x[i] <= h0+h1
        y[i]=(-x[i] + h0 + h1)/(4*h0*h1)
      end
    end
  end
  return y
end

h0, h1 = 1, 2
x=collect(-3:0.1:3)
y = y1(x,h0,h1)
