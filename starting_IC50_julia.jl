#= Here I really would like to start a calculation of the IC50,
because in theory Julia it shoul be very good for this? =#
using Pkg
using Queryverse

println("Function for calculation of the linear curve associated with the data points")
data = readlines("pippo.txt")

data = Queryverse. 
