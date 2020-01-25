function ripetitore(num::Int, rep::Int, text::AbstractString) :: Any
    """This function makes small easy drawings"""
    for i in 1::num
        println("  "^(i+1), text^rep,  "  "^(i+1), text^rep)
    end
end

#ripetitore(15, 2, "<3 ")

function reverser(str::AbstractString)
    """This easy function reverses the strings"""
    collection = collect(str)
    for char in reverse(collection)
        if char!== "m"
            println(char)
        else
            println("Mausa!")
        end
    end
end

#reverser("pillmmmmaaa")

function dna_complementary(sequence_dna::AbstractString)
    """Simple function to genrate reverese complementary sequence"""
    bases = Dict("a" :: "t", "c" :: "g", "g"::"c", "t"::"a")
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

#dna_complementary("gccttgggaatttAAAAAAAAAAAAAAAAAAGGGGGGGGGGGGGGGGGGGG")

function traslatore_dna_in_rna(string_dna :: AbstractString) ::AbstractString
    """Simple function to generate RNA starting from DNA sequences"""
    bases = Dict("a" :: "t", "c" :: "g", "g"::"c", "t"::"T")
    println("You provided a sequence of ", length(string_dna))
    sequence_low_rna = lowercase(string_dna)
    complementary_seq = []
    for el in sequence_low_rna
        append!(complementary_seq, bases[el])
    end  
    return uppercase(join(complementary_seq, ""))   
end

#traslatore_dna_in_rna("gccttgggaattttgcAAAAAAAAAAAAAAAAAAGGGGGGGGGGGGGGGGGGGGTTTTTTTTTTTTTTTTT")

function translator_from_rna(rna_seq :: AbstractString)
    """This function provided a RNA sequence will generate the protein sequence starting from the first encountered AUG"""
    traslation = []
    table = Dict(
        "AUA"::"I", "AUC"::"I", "AUU"::"I", "AUG"::"M", 
        "ACA"::"U", "ACC"::"T", "ACG"::"T", "ACU"::"T", 
        "AAC"::"N", "AAU"::"N", "AAA"::"K", "AAG"::"K", 
        "AGC"::"S", "AGU"::"S", "AGA"::"R", "AGG"::"R",                  
        "CUA"::"L", "CUC"::"L", "CUG"::"L", "CUU"::"L", 
        "CCA"::"P", "CCC"::"P", "CCG"::"P", "CCU"::"P", 
        "CAC"::"H", "CAU"::"H", "CAA"::"Q", "CAG"::"Q", 
        "CGA"::"R", "CGC"::"R", "CGG"::"R", "CGU"::"R", 
        "GUA"::"V", "GUC"::"V", "GUG"::"V", "GUU"::"V", 
        "GCA"::"A", "GCC"::"A", "GCG"::"A", "GCU"::"A", 
        "GAC"::"D", "GAU"::"D", "GAA"::"E", "GAG"::"E", 
        "GGA"::"G", "GGC"::"G", "GGG"::"G", "GGU"::"G", 
        "UCA"::"S", "UCC"::"S", "UCG"::"S", "UCU"::"S", 
        "UUC"::"F", "UUU"::"F", "UUA"::"L", "UUG"::"L", 
        "UAC"::"Y", "UAU"::"Y", "UAA"::"_", "UAG"::"_", 
        "UGC"::"C", "UGU"::"C", "UGA"::"_", "UGG"::"W" )
    
    start_translation = findfirst("AUG", uppercase(rna_seq))[2]
    triplets = 2
    for (num, sequence) in enumerate(start_translation:length(rna_seq))
        if num % 3 == 0 && num < length(rna_seq)
            triplents = rna_seq[sequence:sequence + triplets]
            println(triplents)
            append!(traslation, table[triplents])
        end
    end
    return join(traslation, "")
end

translator_from_rna("UUUAUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGAUUCACAUGUAAA")
