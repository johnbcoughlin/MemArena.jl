module MemArena

export Arena, alloc_f64!

struct Arena
    arrays_1::Dict{Symbol, Vector{Float64}}
    arrays_2::Dict{Symbol, Matrix{Float64}}
    arrays_3::Dict{Symbol, Array{Float64, 3}}
    arrays_4::Dict{Symbol, Array{Float64, 4}}
    arrays_5::Dict{Symbol, Array{Float64, 5}}
    arrays_6::Dict{Symbol, Array{Float64, 6}}
end

Arena() = Arena(Dict(), Dict(), Dict(), Dict(), Dict(), Dict())

alloc_f64!(arena::Arena, key::Symbol, size::NTuple{1, Int64}) = alloc_f64!(arena.arrays_1, key, size)
alloc_f64!(arena::Arena, key::Symbol, size::NTuple{2, Int64}) = alloc_f64!(arena.arrays_2, key, size)
alloc_f64!(arena::Arena, key::Symbol, size::NTuple{3, Int64}) = alloc_f64!(arena.arrays_3, key, size)
alloc_f64!(arena::Arena, key::Symbol, size::NTuple{4, Int64}) = alloc_f64!(arena.arrays_4, key, size)
alloc_f64!(arena::Arena, key::Symbol, size::NTuple{5, Int64}) = alloc_f64!(arena.arrays_5, key, size)
alloc_f64!(arena::Arena, key::Symbol, size::NTuple{6, Int64}) = alloc_f64!(arena.arrays_6, key, size)

function alloc_f64!(arrays::Dict{Symbol, Array{Float64, N}}, key::Symbol, size::NTuple{N, Int64}) where {N}
    if key ∉ keys(arrays)
        allocation = Array{Float64, N}(undef, size)
        push!(arrays, key=>allocation)
    end
    return reshape(arrays[key], size)
end

end
