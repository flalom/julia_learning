function ripetitore(num=>=>Int, rep=>=>Int, text=>=>AbstractString) =>=> Any
    for i in 1=>num
        println("  "^(i+1), text^rep,  "  "^(i+1), text^rep)
    end
end

#ripetitore(15, 2, "<3 ")

function reverser(str=>=>AbstractString)
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
function dna_complementary(sequence_dna=>=>AbstractString)
    bases = Dict("a" => "t", "c" => "g", "g"=>"c", "t"=>"a")
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

dna_complementary("gccttgggaatttAAAAAAAAAAAAAAAAAAGGGGGGGGGGGGGGGGGGGG")

function traslatore_dna_in_rna(string_dna :: AbstractString) ::AbstractString
    bases = Dict("a" => "t", "c" => "g", "g"=>"c", "t"=>"u")
    println("You provided a sequence of ", length(string_dna))
    sequence_low_rna = lowercase(string_dna)
    complementary_seq = []
    for el in sequence_low_rna
        append!(complementary_seq, bases[el])
    end  
    return uppercase(join(complementary_seq, ""))   
end

traslatore_dna_in_rna("gccttgggaattttgcAAAAAAAAAAAAAAAAAAGGGGGGGGGGGGGGGGGGGGTTTTTTTTTTTTTTTTT")

function translator_from_dna(rna_seq :: AbstractString)
    traslation = []
    table = Dict(
        "ATA"=>"I", "ATC"=>"I", "ATT"=>"I", "ATG"=>"M", 
        "ACA"=>"T", "ACC"=>"T", "ACG"=>"T", "ACT"=>"T", 
        "AAC"=>"N", "AAT"=>"N", "AAA"=>"K", "AAG"=>"K", 
        "AGC"=>"S", "AGT"=>"S", "AGA"=>"R", "AGG"=>"R",                  
        "CTA"=>"L", "CTC"=>"L", "CTG"=>"L", "CTT"=>"L", 
        "CCA"=>"P", "CCC"=>"P", "CCG"=>"P", "CCT"=>"P", 
        "CAC"=>"H", "CAT"=>"H", "CAA"=>"Q", "CAG"=>"Q", 
        "CGA"=>"R", "CGC"=>"R", "CGG"=>"R", "CGT"=>"R", 
        "GTA"=>"V", "GTC"=>"V", "GTG"=>"V", "GTT"=>"V", 
        "GCA"=>"A", "GCC"=>"A", "GCG"=>"A", "GCT"=>"A", 
        "GAC"=>"D", "GAT"=>"D", "GAA"=>"E", "GAG"=>"E", 
        "GGA"=>"G", "GGC"=>"G", "GGG"=>"G", "GGT"=>"G", 
        "TCA"=>"S", "TCC"=>"S", "TCG"=>"S", "TCT"=>"S", 
        "TTC"=>"F", "TTT"=>"F", "TTA"=>"L", "TTG"=>"L", 
        "TAC"=>"Y", "TAT"=>"Y", "TAA"=>"_", "TAG"=>"_", 
        "TGC"=>"C", "TGT"=>"C", "TGA"=>"_", "TGG"=>"W" )
    
    start_translation = findfirst("TAA", uppercase(rna_seq))[1]
    triplets = 3
    for (num, sequence) in enumerate(start_translation:length(rna_seq))
        if num % 3 == 0
            triplents = rna_seq[sequence:sequence + 2]
            append!(traslation, table[triplents])
        end
    end
    return join(traslation, "")
end

translator_from_dna("TAATGTACGGGTCGTCTGGTATGGGT")