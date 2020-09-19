struct connection
    host::String
    port::String
    auth::String
    connString::String
    function connection(host::String, port::String, usr::String, psw::String)
        if host == "" || port == ""
            error("Invalid host or port, neither can be an empty string")
        end
        if usr == "" || psw == ""
            error("Invalid username or password, neither can be an empty string")
        end
        auth = base64encode("$usr:$psw")
        connString = "http://$host:$port"
        new(host, port, auth, connString)
    end
end