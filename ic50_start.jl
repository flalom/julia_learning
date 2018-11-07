using Atom.Markdown

#add a variable and playing with it
messere = "pippo cicuta minatore saldatore"
#making a for cycle
for i in 1:2
    print("Hello how are you?? \n")
    print("Quante pila ave lu poccu? blabla??"); a = readline()
    print("Lu poccu ave $a pilas")
    end

#Justify the text adding 70 spaces
rightjustify = (" "^65 * "monty")
print(rightjustify)

#printing a nice reticula
reticula = function()
    print("+ - - - - - +" ^2)
    print("|         |         |" ^5 )
    print("+ - - - - - +" ^2)
end

reticula()

using ThinkJulia
🐢 = Turtle()
@svg begin
    forward(🐢, 100)
end

🐢 = Turtle()
@svg begin
    for i in 1:4
        forward(🐢, 100)
        turn(🐢, -90)
    end
end

Encapsulation

The first exercise asks you to put your square-drawing code into a
function definition and then call the function, passing the turtle as a parameter.
Here is a solution:

function square(t)
    for i in 1:4
        forward(t, 100)
        turn(t, -90)
    end
end
🐢 = Turtle()
@svg begin
    square(🐢)
end

x = 4
if 0 < x < 10
    println("x is a positive single-digit number.")
end

function countdown(n)
    if n ≤ 0
        println("Blastoff!")
    else
        print(n, " ")
        countdown(n-1)
    end
end

countdown(3)

#reading keyboard input
text = readline()



#If you expect the user to type an integer, you can try to convert the return value to Int64:
println("What...is the airspeed velocity of an unladen swallow?"); speed = readline()
parse(Int64, speed)

x != y               # x is not equal to y
  x ≠ y                # (\ne TAB)
  x > y                # x is greater than y
  x < y                # x is less than y
  x >= y               # x is greater than or equal to y
  x ≥ y                # (\ge TAB)
  x <= y               # x is less than or equal to y
  x ≤ y                # (\le TAB)

  prefixes = "JKLMNOPQ"
  suffix = "ack"

  for letter in prefixes
      println(letter * suffix)
  end

 a = "sjhdsjfh"
 b = "pippolo"

 for lettera in a
     println(lettera * b)
 end


 word = "banana"
 counts = 0
 for letter in word
     if letter == 'a'
         global counts += 1
     end
 end
 println(counts)
