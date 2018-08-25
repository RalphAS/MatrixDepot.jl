# return info comment strings for UF sparse matrix
if VERSION >= v"0.7.0-"
    Sparse = SuiteSparse.CHOLMOD.Sparse
elseif isdefined(:SparseArrays)
    Sparse = Base.SparseArrays.CHOLMOD.Sparse
else
    Sparse = Base.SparseMatrix.CHOLMOD.Sparse
end

function ufinfo(filename::AbstractString)
    io = IOBuffer()
    open(filename,"r") do mmfile
        ll = readline(mmfile)
        while length(ll) > 0 && ll[1] == '%'
            println(io, ll)
            ll = readline(mmfile)
        end
    end
    String(take!(io))
end

function trymmread(path::AbstractString)
    finfo = fileinfo(path)
    if finfo !== nothing &&
        finfo.field isa MMFieldPattern &&
        !(finfo.symmetry isa MMSymmetryGeneral)

        mmread(path)
    else
        try
            sparse(Sparse(path))
        catch
            mmread(path)
        end
    end
end

"""
    metareader(dat::RemoteMatrixData)
return dictionary with all data (matrices, rhs, other metadata).
The data may be accessed using the keys contained in data.metadata.
The keys are identical to the names of the files keeping the data.
"""
function metareader(data::RemoteMatrixData)
    if length(data.metadata) == 0
        loadmatrix(data)
    end
    result = Dict{String,Any}()
    for name in data.metadata
        result[name] = metareader(data, name)
    end
    result
end

metareader(data::MatrixData) = nothing

"""
    metareader(data:RemoteMatrixData, key::AbstractString)
return specific data files (matrix, rhs, solution, or other metadata.
The `key` must be contained in data.metadata or `nothing` is returned.
"""
function metareader(data::RemoteMatrixData, name::AbstractString)
    if length(data.metadata) == 0
        loadmatrix(data)
    end
    dc = data.datacache
    if haskey(dc, name)
        return dc[name]
    end
    if name in data.metadata
        path = joinpath(dirname(matrixfile(data)), name)
        m = endswith(name, ".mtx") ? trymmread(path) : read(path, String)
        if data.status[]
            dc[name] = m
        end
        m
    else
        nothing
    end
end

#internal helper to select special metadata (matrix, rhs, or solution)
function readmetaext(data::RemoteMatrixData, exli::AbstractString...)
    base = rsplit(data.name, '/', limit=2)[end]
    for ext in exli
        f = string(base, ext, ".mtx")
        if f in data.metadata
            return metareader(data, f)
        end
    end
    nothing
end

matrix(data::RemoteMatrixData) = readmetaext(data, "")
rhs(data::RemoteMatrixData) = readmetaext(data, "_b", "_rhs1", "_rhs")
solution(data::RemoteMatrixData) = readmetaext(data, "_x")

matrix(data::GeneratedMatrixData, args...) = data.func(args...)
matrix(data::MatrixData, args...) = nothing
rhs(data::MatrixData, args...) = nothing
solution(data::MatrixData, args...) = nothing

