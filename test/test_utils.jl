#######       test the function            #######
##################################################
##################################################
@testset "for vector without 'rows' option" begin
    A = [9 ,2 ,9 ,5]
    C, ia, ic = uniq(A)  
    expected_C = [2,5,9]
    expected_ia = [2,4,1]
    expected_ic = [3, 1, 3,2]
    
    @test C == expected_C
    @test ia == expected_ia
    @test ic == expected_ic
end
##################################################
##################################################
@testset "for vector with 'rows' option" begin
    A = [9 ,2 ,9 ,5]
    C, ia, ic = uniq(A,"rows")  
    expected_C = [9,2,9,5]
    expected_ia = [1]
    expected_ic = [1]
    
    @test C == expected_C
    @test ia == expected_ia
    @test ic == expected_ic
end
##################################################
##################################################
@testset "for matrix without 'rows' option" begin
    A = [9 2 5; 9 2 5]
    C, ia, ic = uniq(A)  
    expected_C = [2,5,9]
    expected_ia = [3,5,1]
    expected_ic = [3,3,1,1,2,2]
    
    @test C == expected_C
    @test ia == expected_ia
    @test ic == expected_ic
end

##################################################
##################################################
@testset "for matrix with 'rows' option" begin
    A = [9 2 5; 9 2 5]
    C, ia, ic = uniq(A,"rows")  
    expected_C = [9,2,5]
    expected_ia = [1]
    expected_ic = [1,1]
    
    @test C == expected_C
    @test ia == expected_ia
    @test ic == expected_ic
end

##################################################
@testset "test my code for sum" begin
    @test my_sum_upm(2.,3.) == 5
end