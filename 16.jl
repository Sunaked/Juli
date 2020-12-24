include("../roblib.jl")
function m_all(r)
    step = through_rectangles_into_angle(r, (Sud, West))
    way = Ost
    while (isborder(r, Nord) == false) || (isborder(r, Ost) == false)
        putmarkers_if_possible!(r, way)
        if (isborder(r, Nord) == false)
            move!(r, Nord)
        end
        way = inverse(way)
    end
    through_rectangles_into_angle(r, (Sud, West))
    movements_if_possible!(r, (Nord, Ost), reverse(step))
end
m_all(r)