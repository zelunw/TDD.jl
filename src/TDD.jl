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

    AllNodes = [] #lists connected vertices of each vertex in graph
    for i in 1:length(graph_input) 
        push!(AllNodes, DCneighbors(graph_input, i::Int64))
    end

 
    ConnectedToNode = [] 
  

    for i in 1:length(graph_input) #stores the connected vertices of all vertices that directly connect to node
        if in(node, AllNodes[i]) == true
            union!(ConnectedToNode, AllNodes[i]) #ConnectedToNode is now an array                           
        else
        end
    end

    ConnectedToNode_Set = Set( convert(Array{Int64,1}, ConnectedToNode) ) #https://stackoverflow.com/questions/35482527/how-do-i-change-the-data-type-of-a-julia-array-from-any-to-float64

    

    if SOMETHING
        return ConnectedToNode_Set
    else
    end

    for j in ConnectedToNode_Set    
    ICneighbors(graph_input, j) #at the end try put ::Int64 back in here...I don't understand why it wouldnt work...
    end

   

end















end #module end
