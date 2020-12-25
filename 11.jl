include("../roblib.jl")

function m_center(r)
    step = through_rectangles_into_angle(r, (Sud, West))

    stepOst = sum(step[1])
    stepsNord = sum(step[2])

    movements!(r, Nord, stepsNord)
    putmarker!(r)
    stepSud = get_num_movements!(r, Nord)

    movements!(r, Ost, stepOst)
    putmarker!(r)
    stepWest = get_num_movements!(r, Ost)

    movements!(r, Sud, stepSud)
    putmarker!(r)
    movements!(r, Sud)

    movements!(r, West, stepWest)
    putmarker!(r)
    movements!(r, West)

    movements!(r, (Nord, Ost), reverse(step))
end
m_center(r)