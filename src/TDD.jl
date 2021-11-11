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
    
     
function ICneighbors(graph_input, node::Int64) #this is way convoluted implementation. An exemplary example solution of iteration and recursion examples would be helpful

    #if node does not exist return error    
    try
        graph_input[node]
    catch e
        error("node does not exist")
    end
    
    #list connected vertices of each vertex in graph
    AllNodes = [] 
    for i in 1:length(graph_input) 
        push!(AllNodes, DCneighbors(graph_input, i::Int64)) #this returns a Set
    end

    #store connected vertices of all vertices that directly connect to `node`
    ConnectedToNode = [] 
    for i in 1:length(graph_input) 
        if in(node, AllNodes[i]) == true
            union!(ConnectedToNode, AllNodes[i]) #ConnectedToNode is now an array (that has been unioned)...I think that's cuz ConnectedToNode is an array...
                                                 #note: a more logical implementation would be to just find all i that have connection to 'node'. But this works...
                                                 #wondering which way would perform faster...                           
        else
        end
    end

    ConnectedToNode_Array = []
    push!(ConnectedToNode_Array, Set([node])) #this starts ConnectedToNode_Array[1] so that ConnectedToNode pushes to ConnectedToNode_Array[2], so that
                                              #nodeset_input[z-1] does not eval nodeset_input[0]
                                              #note that this becomes a Set because pushing a Set into an empty array Any[]
    
    push!(ConnectedToNode_Array, Set( convert(Array{Int64,1}, ConnectedToNode) ) ) #https://stackoverflow.com/questions/35482527/how-do-i-change-the-data-type-of-a-julia-array-from-any-to-float64

    

    #honestly I think up to this point it works as intended


    #now can start recursive function

    z_input = 2

    function recursor(graph_input_input, AllNodes_input, nodeset_input, z) #the reason I'm doing this again is I don't know how to get around reinitializing
                                                                        #the ConnectedToNode object with every run
                                                                        #so this way ConnectedToNode_Array is initialized outside the function...
                                                                        #also when I highlight this function to evaluate in REPL it seems to evaluate like 5 times...why? Seen this with other scripts too

        if ( nodeset_input[z] == nodeset_input[z - 1] )  &  ( length(nodeset_input) == (2 + length(graph_input_input)) )

                                                    #this could produce incorrect exit with terminal nodes with 1 partner since union returns
                                                    #the nodeset_input[~next~] as something == the previous
                                                    #need to force it to iterate through the latest nodeset_input one more time
                                                    #change nodeset_input[z] == nodeset_input[z - 1] to nodeset_input[z] == nodeset_input[z - 2]
                                                        #^reverted
                                                    #z_input = 2 to z_input = 3
                                                        #^reverted
                                                    #added another push step in initialization of ConnectedToNode_Array
                                                        #^reverted
                                                    #hmm that doesnt help, just prolonged the problem
                                                    #no also this occurs with non terminal cases too. Makes me think my recursion is not working right
                                                        #fixed, see below the in.()
                                                    #now works for most cases except node 4,5,6,7,8 of train_graph
                                                    #problem lies in recursor always restarting with node
                                                    #for example if node 8, then tracing the ConnectedToNode_Array stack,
                                                    #the stack of nodeset_input[z] would be [8], [8, 7, 6], [8, 7, 6] which would trigger early exit
                                                    #add an & statement to if exit condition to fix

            return ConnectedToNode_Array #return ConnectedToNode_Array to see stack of all connected nodes

        else

            for i in 1:length(graph_input_input) 
                if any( in.(nodeset_input[z], Ref(AllNodes_input[i])) ) == true #THIS IS NOT WORKING HOW I THINK IT WORKS #fixed. See docs for in() and any()
                    union!(nodeset_input[z], AllNodes_input[i]) #Set union with Set gives Set
                else
                end
            end

            push!(nodeset_input, nodeset_input[z]) #this already gives a Set since both those are Sets
            
            recursor(graph_input_input, AllNodes_input, nodeset_input, z+1)
            
        end
    end

    #call
    recursor(graph_input, AllNodes, ConnectedToNode_Array, z_input)




   

end #function ICneighbors end















end #module end
