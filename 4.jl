include("../roblib.jl")

function mark_stairs(r)
    steps = through_rectangles_into_angle(r, (Sud, West))

    mark = mark_and_enumerate_if_possible!(r, Ost) - 1
    while isborder(r, Nord) == false
        movements!(r, West)
        move!(r, Nord)
        putmarkers!(r, Ost, mark)
        mark -= 1
    end

    through_rectangles_into_angle(r, (Sud, West))
    movements!(r, (Nord, Ost), reverse(steps))
end
mark_stairs(r)