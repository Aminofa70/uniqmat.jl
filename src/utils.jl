### function uniq behaves like MATALAB unique function
function uniq(A, cond::String="[]")
    # Handling vectors
    if isa(A, Vector)
        if cond == "rows"
            C = unique(A, dims = 2)
            ia = [1]
            ic = [1]
        
            return C, ia, ic
        elseif cond == "[]"
            dims = 1
            @assert ndims(A) ∈ (1, 2) "The input array must be either 1D or 2D."
            slA = ndims(A) > 1 ? eachslice(A, dims=dims) : A 
            ia = unique(i -> slA[i], axes(A, dims))
            sort!(ia, by=i -> slA[i])
            C = stack(slA[ia], dims=dims)
            slC = ndims(C) > 1 ? eachslice(C, dims=dims) : C
            ic = map(r -> findfirst(==(slA[r]), slC), axes(A, dims))
    
            return C, ia, ic
        end
    end

    # Handling matrices
    if isa(A, Matrix)
        if cond == "rows"
            dims = 1
            @assert ndims(A) ∈ (1, 2) "The input array must be either 1D or 2D."
    
            # Generate a view for each row of the matrix A
            slA = ndims(A) > 1 ? eachslice(A, dims=dims) : [A]
    
            # Unique indices based on row values
            ia = unique(i -> vec(slA[i]), axes(A, dims))
            sort!(ia, by=i -> vec(slA[i]))
    
            # Stack the unique rows to form a matrix
            C = vcat([slA[i] for i in ia]...)
    
            # For mapping each original row to its corresponding unique row in C
            slC = ndims(C) > 1 ? eachslice(C, dims=dims) : [C]
            ic = map(r -> findfirst(==(vec(slA[r])), vec.(slC)), axes(A, dims))
    
            return vec(C), ia, ic
        elseif cond == "[]"
            dims = 1
            A = vec(A)
            @assert ndims(A) ∈ (1, 2) "The input array must be either 1D or 2D."
            slA = ndims(A) > 1 ? eachslice(A, dims=dims) : A
            ia = unique(i -> slA[i], axes(A, dims))
            sort!(ia, by=i -> slA[i])
            C = stack(slA[ia], dims=dims)
            slC = ndims(C) > 1 ? eachslice(C, dims=dims) : C
            ic = map(r -> findfirst(==(slA[r]), slC), axes(A, dims))
            return C, ia, ic       
        end     
    end
    
    if A == []
       cond == "rows"
       return [], [], []
    elseif cond == "[]"
        return [], [], []
    end 
end # end function 

"""
Example-> A is a vector 
````
julia> A = [2. ,3. ,5. ,7. ,1.]
julia> C,ia,ic = uniq(A)  
julia> C
5-element Vector{Float64}:
 1.0
 2.0
 3.0
 5.0
 7.0
julia> ia
5-element Vector{Int64}:
 5
 1
 2
 3
 4
julia> ic
5-element Vector{Int64}:
 2
 3
 4
 5
 1
 ````
"""
#######################################
"""
Example-> A is a matrix
````
julia> A = [2 3 5;4 3 2]
julia> C,ia,ic = uniq(A)
julia> C 
4-element Vector{Int64}:
 2
 3
 4
 5
julia> ia 
4-element Vector{Int64}:
 1
 3
 2
 5
julia> ic
6-element Vector{Int64}:
 1
 3
 2
 2
 4
 1
 ````
"""