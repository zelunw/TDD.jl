module TDD

# Write your package code here.

#1

export DCneighbors

function DCneighbors(graph_input, node::Int64) #function argument type declaration for graph_input works like this? Since it is an object of Array{Array{Int64,1},1}

    try        
     Set(vcat(node, graph_input[node])) #Sets are unordered
    catch e
        if isa(e, BoundsError)
            error("node does not exist")
        else
         
        end
    end
        
end
    
     
    










end
