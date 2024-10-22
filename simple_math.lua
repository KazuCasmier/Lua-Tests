local running = true

local function the_math(z)
    if z > 4 then
        return io.write("\nPlease enter a valid selection 1-4\n")
    end
    local x
    local y
    io.write("\n-Please enter your two numbers-")
    io.write("\nFirst num: ")
    x = io.read("*n")
    io.write("Second Num: ")
    y = io.read("*n")

    if z == 1 then
        local z = x + y
        return io.write("\n", x, " + ", y, " = ", z, "\n") 
    elseif z == 2 then
        local z = x - y
        return io.write("\n", x, " - ", y, " = ", z, "\n")  
    elseif z == 3 then
        local z = x * y
        return io.write("\n", x, " * ", y, " = ", z, "\n")   
    elseif z == 4 then
        local z = x / y
        return io.write("\n", x, " / ", y, " = ", z, "\n")
    end
end

local function close_prog()
    io.write("Closing Program, Thank you!\n")
    running = false
end


while running == true do
    io.write("\nWelcome to the two number math program! what would you like to do?\n1- addition\n2- subtraction\n")
    io.write("3- multipulcation\n4- division\nQ- quit\n->")
    A = io.read("*n")
    if tonumber(A) then
        the_math(A)
    else
        close_prog()
    end
end
