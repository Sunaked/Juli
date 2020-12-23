include("../roblib.jl")

function mark_all(r)
    num = through_rectangles_into_angle(r, (Sud, West))
    way = Ost
    while (isborder(r, Nord) == false) || (isborder(r, Ost) == false)
        putmarkers!(r, way)
        if (isborder(r, Nord) == false)
            move!(r, Nord)
        end
        way = inverse(way)
    end
    through_rectangles_into_angle(r, (Sud, West))
    movements!(r, (Nord, Ost), reverse(num))
end
mark_all(r)