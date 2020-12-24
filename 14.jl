include("../roblib.jl")

function m_kross(r::Robot)
    for side in (Up, Left, Down, Right)
        num_steps = mark_and_enumerate_if_possible!(r, side)
        movements_if_possible!(r, inverse(side), num_steps)
    end
end
m_kross(r)