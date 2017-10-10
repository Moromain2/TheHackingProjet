#write your code here

def echo(greet)
  if greet == "hello" || "bye"
    "#{greet}"
  end
end

def shout(shouting)
  if shouting == "hello" || "hello world"
    "#{shouting}".upcase
  end
end

def repeat(message)
  if message == "hello"
    "#{message} #{message}"
  end
end
