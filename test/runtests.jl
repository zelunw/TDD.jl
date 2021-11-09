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



    @test DCneighbors(undirected_graph, 1) == [1, 2, 3];
    @test DCneighbors(undirected_graph, 2) == [2, 1];
    @test DCneighbors(undirected_graph, 3) == [3, 1];
    @test DCneighbors(undirected_graph, 4) == [4, 5];
    @test DCneighbors(undirected_graph, 5) == [5, 4];

    @test DCneighbors(directed_graph, 1) == [1, 3];
    @test DCneighbors(directed_graph, 2) == [2, 1];
    @test DCneighbors(directed_graph, 3) == [3];
    @test DCneighbors(directed_graph, 4) == [4, 5];
    @test DCneighbors(directed_graph, 5) == [5];
    
    @test_throws ErrorException("node does not exist") DCneighbors(undirected_graph, 6);



    #2




end






