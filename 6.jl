include("../roblib.jl")

function m_rect_per(r)
    steps = through_rectangles_into_angle(r, (Sud, West))

    way = Ost

    while (isborder(r, Nord) == false)
        if isborder(r, way)
            way = inverse(way)
            move!(r, Nord)
        else move!(r, way)
        end
    end

    while (ismarker(r) == false)
        putmarker!(r)
        if isborder(r, right(way))
            move!(r, way)
        else
            way = right(way)
            move!(r, way)
        end
    end
    through_rectangles_into_angle(r, (Sud, West))
    movements!(r, (Nord, Ost), reverse(steps))
end
m_rect_per(r)