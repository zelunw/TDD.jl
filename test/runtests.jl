using TDD
using Test

@testset "TDD.jl" begin
    # Write your tests here.
  
    #1.
    @test returnDCneighbors(1) == [1, 2, 3];
    @test returnDCneighbors(2) == [2, 1];
    @test returnDCneighbors(3) == [3, 1];
    @test returnDCneighbors(4) == [4, 5];
    @test returnDCneighbors(5) == [5, 4];


end






