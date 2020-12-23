include("../roblib.jl")

function mark_perimetr(r)
    steps = through_rectangles_into_angle(r, (Nord,Ost))
    way = Sud
    for i in 0:1:3
        putmarkers!(r, way)
        way = right(way)
    end
    movements!(r, (Sud, West), reverse(steps))
end
mark_perimetr(r)