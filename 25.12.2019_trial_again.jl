function ripetitore(num::Int, rep::Int, text::AbstractString) :: Any
    for i in 1:num
        println('  '^(i+1), text^rep,  '  '^(i+1), text^rep)
    end
end

#ripetitore(15, 2, '<3 ')

function reverser(str::AbstractString)
    collection = collect(str)
    for char in reverse(collection)
        if char!== 'm'
            println(char)
        else
            println('Mausa!')
        end
    end
end

#reverser('pillmmmmaaa')
function dna_complementary(sequence_dna::AbstractString)
    bases = Dict('a' => 't', 'c' => 'g', 'g'=>'c', 't'=>'a')
    complementary_seq = []
    sequence_low = lowercase(sequence_dna)
    for el in sequence_low
         if el in keys(bases)
            append!(complementary_seq, bases[el])
         else
            println("The base you put is not right, please re-enter the correct sequence and run it again")
            break
         end
    end  
    return uppercase(join(complementary_seq, ""))
    
end

dna_complementary("gccsttgggaatttAAAAAAAAAAAAAAAAAAGGGGGGGGGGGGGGGGGGGG")

