#= Here I really would like to start a calculation of the IC50,
because in theory Julia it shoul be very good for this? =#
using Pkg
using Queryverse

println("Function for calculation of the linear curve associated with the data points")
#I would like to make a function that is asking the user to save the data
data = readlines("pippo.txt")
data = load("2018-10-06__Paper_table.xlsx", "Jennifer Keiser Author   Full ") |> DataFrame
pipo = data |> @filter(_.year==2018)
save("gigio.csv", delim=';', pipo)

using Queryverse
#I will make a function that is asking for the DataFrame of the effect
calling_data_frame = function()
    #entering the file name and all the basic thigs that I would need from this function
    println("Please enter the file name, complete of extension")
    file_toload = readline(stdin)

    #Now staring playing with the file just loaded
    #Loading the dataset now and globally saving the dataset
    global data_df = load(file_toload) |> DataFrame
end
