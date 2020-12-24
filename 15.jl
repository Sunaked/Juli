include("../roblib.jl")

function m_per(r)
    step = through_rectangles_into_angle(r, (Sud, West))

    way = Nord
    for i in 0:1:3
        putmarkers_if_possible!(r, way)
        way = right(way)
    end

    movements_if_possible!(r, (Nord, Ost), reverse(step))
end
m_per(r)