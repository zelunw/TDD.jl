module TDD

# Write your package code here.

#1



function DCneighbors(graph_input, node::Int64) #function argument type declaration for graph_input works like this? Since it is an object of Array{Array{Int64,1},1}

    try        
     vcat(node, graph_input[node])
    catch e
        if isa(e, BoundsError)
            error("node does not exist")
        else
         
        end
    end
        
end
    
     
    










end
