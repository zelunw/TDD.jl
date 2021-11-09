using TDD
using Test

@testset "TDD.jl" begin
    # Write your tests here.
  
    #1.
    @test returnDCneighbors(graph, 1) == [1, 2, 3];
    @test returnDCneighbors(graph, 2) == [2, 1];
    @test returnDCneighbors(graph, 3) == [3, 1];
    @test returnDCneighbors(graph, 4) == [4, 5];
    @test returnDCneighbors(graph, 5) == [5, 4];
    @test_throws ErrorException("node does not exist") returnDCneighbors(graph, 6);


end






