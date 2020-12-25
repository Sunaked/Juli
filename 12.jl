include("../roblib.jl")

size = 0
position = [0, 0]

function m_chess(r::Robot, n::Int = 0)
    global size
    
    if n != 0
        size = n
    end

    way = Ost
    mark_row(r, way)
    while isborder(r, Nord) == false
        move_decart!(r, Nord)
        way = inverse(way)
        mark_row(r,way)
    end

end
function move_decart!(r::Robot, way::HorizonSide)
    global position
    if way == Nord
        position[2] += 1
    elseif way == Sud
        position[2] -= 1
    elseif way == Ost
        position[1] += 1
    else
        position[1] -= 1
    end
    move!(r, way)
end
function get_cell_size()
    global size
    println("Type size of cell: ")
    size = parse(Int, readline())
end

function mark_row(r::Robot, way::HorizonSide)       
    putmarker_chess!(r)
    while isborder(r, way) == false
        move_decart!(r, way)
        putmarker_chess!(r)
    end
end

function putmarker_chess!(r::Robot)
    global position
    if (mod(position[1], 2 * size)) < size && (mod(position[2], 2 * size)) < size || (mod(position[1] + size, 2 * size)) < size && (mod(position[2], 2 * size)) >= size
        putmarker!(r)
    end
end


m_chess(r,3)