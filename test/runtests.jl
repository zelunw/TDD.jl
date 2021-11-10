using TDD
using Test

@testset "TDD.jl" begin
    # Write your tests here.
  
    #1.

    
    undirected_graph = [ 
        [2, 3], #nodes reacheable from node 1
        [1],    #nodes reacheable from node 2
        [1],    #nodes reacheable from node 3
        [5],    #nodes reacheable from node 4
        [4]     #nodes reacheable from node 5
    ]

    #based on Figure 1 from homework, node order 2 --> 1 --> 3; 4 --> 5
    directed_graph = [ 
        [3],    #nodes reacheable from node 1
        [1],    #nodes reacheable from node 2
        [],     #nodes reacheable from node 3
        [5],    #nodes reacheable from node 4
        []      #nodes reacheable from node 5
    ]



    @test DCneighbors(undirected_graph, 1) == Set([3, 2, 1]) #Sets are unordered
    @test DCneighbors(undirected_graph, 2) == Set([2, 1])
    @test DCneighbors(undirected_graph, 3) == Set([3, 1])
    @test DCneighbors(undirected_graph, 4) == Set([4, 5])
    @test DCneighbors(undirected_graph, 5) == Set([5, 4])

    @test DCneighbors(directed_graph, 1) == Set([1, 3])
    @test DCneighbors(directed_graph, 2) == Set([2, 1])
    @test DCneighbors(directed_graph, 3) == Set([3])
    @test DCneighbors(directed_graph, 4) == Set([4, 5])
    @test DCneighbors(directed_graph, 5) == Set([5])
    
    @test_throws ErrorException("node does not exist") DCneighbors(undirected_graph, 6)



    #2

    @test ICneighbors(undirected_graph, 1) == Set([1, 2, 3]);
    @test ICneighbors(undirected_graph, 2) == Set([1, 2, 3]);
    @test ICneighbors(undirected_graph, 3) == Set([1, 2, 3]);
    @test ICneighbors(undirected_graph, 4) == Set([4, 5]);
    @test ICneighbors(undirected_graph, 5) == Set([4, 5]);

    @test ICneighbors(directed_graph, 1) == Set([1, 2, 3]);
    @test ICneighbors(directed_graph, 2) == Set([1, 2, 3]);
    @test ICneighbors(directed_graph, 3) == Set([1, 2, 3]);
    @test ICneighbors(directed_graph, 4) == Set([4, 5]);
    @test ICneighbors(directed_graph, 5) == Set([4, 5]);
    
    @test_throws ErrorException("node does not exist") ICneighbors(undirected_graph, 6);




end






