#write your code here

def add(a,b)
  a+b
end

def subtract(a,b)
  a-b
end

def sum(a)
  b = 0
    a.each do | c |
      b += c
    end
  return b
end

def multiply(array)
		(array).inject {|prod, n| prod * n }
end

def power(a,b)
  c = (a**b)
  return c
end

def factorial(a)
  if a == 0
    return 0
  end
  b = 1
  else
    (1..a).each do | i |
    b *= i
  end
  b
end
