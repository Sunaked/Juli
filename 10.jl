include("../roblib.jl")

function middle_temp(r)
    counter = 0
    temp = 0
    way = Ost
    
    while ((isborder(r, Ost) == false) || (isborder(r, Nord) == false))
        if ismarker(r)
            counter += 1
            temp += temperature(r)
        end
        if isborder(r, way)
            way = inverse(way)
            move!(r, Nord)
        else move!(r, way)
        end
    end
    println(temp/counter)
end
middle_temp(r)