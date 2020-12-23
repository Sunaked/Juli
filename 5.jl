include("../roblib.jl")

function m_angels(r)
    steps = through_rectangles_into_angle(r, (Sud, West))

    putmarker!(r)
    through_rectangles_into_angle(r, (Nord, West))
    putmarker!(r)
    through_rectangles_into_angle(r, (Nord, Ost))
    putmarker!(r)
    through_rectangles_into_angle(r, (Sud, Ost))
    putmarker!(r)
    through_rectangles_into_angle(r, (Sud, West))

    movements!(r, (Nord, Ost), reverse(steps))
end
m_angels(r)