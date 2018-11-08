
function LongestWord(sen::String)
    sentence =[(split(sen, " "))]
    parole = [length(x) for x in split(sen, " ")]
    parole_index = (findmax(parole))
    index_n = (parole_index[2])::Int64
    print(sentence, length(sentence))
    return((parole, index_n, length(parole)))
    #println(sentence[index_n])
end

LongestWord("Ciao pippo come va tutto bene djhakdfjhsdfk oiweruwotidfgsjdfhgsdjhfgsdjfhgsdjfgdsjhfgsjfgdpweokudfks?")


function LongestWord(sen::AbstractString)
    word = [(length(x), x) for x in split(sen, " ")]
    findmax(word)[1][2]
end

LongestWord("Hello, how are you? nested, punctuation?")

#Solution from StackOver flow
#https://stackoverflow.com/questions/49775954/julia-how-to-find-the-longest-word-in-a-given-string/49779704#49779704

function LongestWord2(sen::AbstractString)
           words = matchall(r"\w+", sen) #questa funzione è incredibile e mi ritorna ogni parola!
           words[findmax(length.(words))[2]]
       end

LongestWord2("Ciao pippo come stai, come va tutto, ?jhgjhgfhgfhg, bene? che fai di bellojfhghkgjhfjg")


#problem it shows also punctuation
function LongestWord3(sen::AbstractString)
           word = split(sen, " ")
           word[indmax(length.(word))]
       end

LongestWord3("Hello, how are you? nested, ?punctuation, rano?")


#it splits strangely
function LongestWord2(sen::AbstractString)
           words = split(sen, r"\w+")
           print(words)
           words[findmax(length.(words))[2]]
end

LongestWord2("Ciao pippo come stai, come va tutto bene? che fai di bello!")


#I have not manage to find the right answer to this problem right now, but I will think on that
function FirstFactorial(numero::Int64)

    number_before = collect(1:numero)
    lista = [(x) for x in number_before]
    print(lista)
end

FirstFactorial(8)


function FirstFactorial1(numero::Int64)
    return(factorial(numero))
end

FirstFactorial1(8)

#It is a superficial solution, I am missing how to reverse the structure
a = []
function FirstReverse(stringa::AbstractString)
    for x in matchall(r"\w+", stringa) #se metti uno spazio dopo la w+, la regex cambia!
        insert!(a,1, reverse(x))#https://docs.julialang.org/en/release-0.4/stdlib/collections/?highlight=push#Base.push! this
        #made the trick, but now it is printing all the process
        #the insert! takes(array, index, element)
    end
    println(a)#if I insert here the print I get the results after the loop is done, so I get the final function.
    #I guess that the presence of this in the loop could be good for debugging purposes
end

FirstReverse("I Love Code")

#= Reasoning here. First: i will need a split in every letter and make an string array of it.
Second: Create an array of letter string, where all the alphabet is
Third: Match the letters which appears on the given string with the ones in the letter array.This will give the index.
Fifth: If the letter is a Z in the given string, the index on the letter array needs to go back to 1
=#

function LetterChanges(stringa::AbstractString)
    #faccio le lettere
    #alphabet = convert(String, collect('a':'z'))#in questo modo converto da char in string \:curry:
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    #Il print dopo mi serve per confermare che i caratteri sono in string e che sono stati convertiti
    println(typeof(alphabet))
    vowels = "aeiou"
    #converto il testo iniziale in stringhe
    for Char(x) in split(stringa, "")
        if x == 'a'
            x = 'Z'
        elseif x in vowels
            uppercase(x)
            else
            Int(x)+1
            Char(x)
            println(x)
        end
    end
end

    #devo trovare il modo di matchare le lettere in alphabet e farmi dare l'index, cosi' posso sommarlo di uno
    #dovrei fare un array di match da alphabet
    #matched = [eachindex(x) for x in testo_iniziale if contains(alphabet, x)]

    #println(length(testo_iniziale))

LetterChanges("Ciao pippo come stai")


#https://gist.github.com/zemadi/11071837
#this solution is very important but it is only for the python 3
def LetterChanges(str):
	lower = str.lower()

	newstring = ""
	lookup = 'abcdefghijklmnopqrstuvwxyz'
	vowels = "aeiou"

	for letter in lower:
	  if letter == "z":
	    newstring += "A"
	  else:
	    letter_index = lookup.index(letter)
	    if lookup[(letter_index+1)] in vowels:
	      vowel_set = lookup[(letter_index+1)]
	      newstring += vowel_set.upper()
	    else:
	      newstring += lookup[(letter_index+1)]
print newstring




def LetterChanges(str):

  # our new string with the modified characters
  newString = ""

  # begin by looping through each character in the string
  for char in str:

    # check if the current character is an alphabetic character
    if char.isalpha():

      # check if character is z
      if char.lower() == 'z':
        char = 'a'

      # if alphabetic character then add 1 to its ASCII value
      # by using the built-in ord function then convert back to character
      else:
        char = chr(ord(char) + 1)

    # if new character is a vowel then capitalize it
    if char in 'aeiou':
      char = char.upper()

    # add this modified character to the new string
    newString = newString + char

  return newString

print LetterChanges("fun times!")

println(Int('a'))

function changeletters(str::String)
    vowels = "aeiouy"
    carr = Vector{Char}(length(str))
    i = 0
    for c in str
        newchar = c == 'z' ? 'a' : c + 1
        #changer = c in vowels? uppercase(c):c
        carr[i+=1] = newchar in vowels ? uppercase(newchar) : newchar
    end
    return String(carr)
end

changeletters("coderbyte")

function LetterChanges2(str::AbstractString)
    v = Set("aeiou")
    #sprint(sizehint=sizeof(str)) do io # use on Julia 0.7 - new keyword argument
    sprint() do io # use on Julia 0.6.2
        for c in str
            c = c == 'z' ? 'a' : c+1 # we assume that we got only letters from 'a':'z'
            print(io, c in v ? uppercase(c) : c)

        end
    end
end

LetterChanges2("coderbyte")

function SimpleAdding(num::Int64)
    #set borders with an if. Note that the first end has to be at the end of the if
    if num > 1000
        return("The number is too big!!")
    end

    for x in reverse(collect(0:num))
        sum = (x*(1+(x))/2)
        #1+1/2= 0; 2+4/2=3;3+9/2
        return(sum)
    end
end

SimpleAdding(15)

function LetterCapitalize(str::AbstractString)
    list = [(string(uppercase(x[1])*x[2:end] * " ")) for x in matchall(r"\w+", str)]
        return(join(list))
end

LetterCapitalize("i ran there last day come stai sei pazzo")

#this function works fine, but the only problem is that once the interger introduced are the same, then the progrsm troll me with an error, for a reason which I do not understand at the moment
function checknumber(num_a::Integer, num_b::Integer)
    if num_b > num_a ? print("True"):num_b < num_a print("False")
    elseif num_a == num_b
        print(-1)
    end
    #return(num_a+num_b)
  end
checknumber(67,67)

function TimeConvert(num::Integer)
    hours = floor(round((num / 60.0), 1), 0)
    if num <= 59
        hours = 0
    end
    minutes = (num % 60)
    if minutes <= 1 && hours <=1
        tempo = ["hour", "minute"]
    elseif minutes > 1 && hours > 1
        tempo = ["hours", "minutes"]
    elseif hours <= 1 && minutes >1
        tempo = ["hour", "minutes"]
    else
        tempo = ["hours", "minute"]
    end
    return(println(hours," ", tempo[1], " : ",minutes, " ", tempo[2]))
end

TimeConvert(63)

function AlphabetSoup(stri::AbstractString)

        lista = [x for x in split(stri, "") if x != " "]
        #Amount of letter for adding the spaces every 4 spaces
        #final = [split(x, "") for x in lista if length > 4]
        #THIS IS THE APPROACH IN PYTHON#s = " ".join(s[i:i+2] for i in range(0, len(s), 2))
        #ricordati della idea di fare un dizionario con carattere da una parte e dall'altra il numero ascii
        return (join(sort(lista)))
end

AlphabetSoup("ciao dottore pussone pissone")

function KaprekarsConstant(num::AbstractString)
    #Control of the length and of the values, I am treating the number as a string
    if length(num) >= 4
        println("Performing operation...")
    else
        println("The lenght of the entered number is not big enough, minumum 4 digits")
      end
        values = [x for x in num]
        values = sort(values)
        values = Set(values)
        values = join(values, "")

return(values)
end

KaprekarsConstant("1876867578779812343264364776896977")

#I can do the set comphrehension also on sets
a = collect(1:100)
b = Set(x for x in a  if x % 2 == 0 && x % 3 == 0)

function CorrectPath(str::AbstractString)
