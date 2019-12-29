function ripetitore(num::Int, rep::Int, text::AbstractString) :: Any
    for i in 1:num
        println("  "^(i+1), text^rep,  "  "^(i+1), text^rep)
    end
end

#ripetitore(15, 2, "<3 ")

function reverser(str::AbstractString)
    collection = collect(str)
    for char in reverse(collection)
        if char!== 'm'
            println(char)
        else
            println("Mausa!")
        end
    end
end

#reverser("pillmmmmaaa")

function DNA_complementary(sequence::AbstractString)
    complementary_seq = []
    sequence = lowercase(collect(sequence))
    for base in sequence
        if base == 'a'
            append!(complementary_seq, base)
        else
            println("Unknown base!")
        end
    end  
end

DNA_complementary("ACTGATCGGGTTAAA")

