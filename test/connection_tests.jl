using Arango
using Test

@testset "Connection Tests" begin
    @test connection("127.0.0.1", "8080", "admin", "1234") isa connection

    let err = nothing
        try
            connection("", "", "admin", "1234")
        catch err
        end

        @test err isa Exception
        @test sprint(showerror, err) == "Invalid host or port, neither can be an empty string"
    end

    let err = nothing
        try
            connection("127.0.0.1", "8080", "", "")
        catch err
        end

        @test err isa Exception
        @test sprint(showerror, err) == "Invalid username or password, neither can be an empty string"
    end
end