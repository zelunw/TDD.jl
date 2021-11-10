module TDD

# Write your package code here.

#1

export DCneighbors
export ICneighbors

function DCneighbors(graph_input, node::Int64) #Does type declaration for object input improve performance? for example `graph_input::Array{Array{Int64,1},1}`
                                               #The graph object can be of type Array{Array{Int64,1},1} or Array{Array{Any,1},1} if there are blank nodes [] in a directed graph
                                               #and Array{Array{Any,1},1} is apparently not a supertype of Array{Array{Int64,1},1} which will throw method error
                                               #any way around this? Would it give a performance boost?

    try        
     Set(vcat(node, graph_input[node])) #Sets are unordered
    catch e
        if isa(e, BoundsError)
            error("node does not exist")
        else
         
        end
    end
        
end
    
     
function ICneighbors(graph_input, node::Int64)

    component = []

    for i in 1:length(graph_input)

        if in(node, DCneighbors(graph_input, i::Int64)) == true
            push!(component, DCneighbors(graph_input, i::Int64))
        else
        end 

    end

    return component

end











end
