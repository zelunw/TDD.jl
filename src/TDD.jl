module TDD

# Write your package code here.

#1

export DCneighbors

function DCneighbors(graph_input::Array{Array{Int64,1},1}, node::Int64) #is there a way to do type declaration on object inputs ie graph_input for performance gainz?

    try        
     Set(vcat(node, graph_input[node])) #Sets are unordered
    catch e
        if isa(e, BoundsError)
            error("node does not exist")
        else
         
        end
    end
        
end

#function ICneighbors(graph_input, node::Int64)
    
     
    










end
