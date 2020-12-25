import HorizonSideRobots: isborder
include("../roblib.jl")

isborder(r::Robot,way::NTuple{2,HorizonSide})::Bool = (isborder(r,way[1]) || isborder(r,way[2]))

inverse(way::NTuple{2,HorizonSide}) = (inverse(way[1]), inverse(way[2]))

get_num_movements_if_possible!(r::Robot, way::NTuple{2,HorizonSide}) = (get_num_movements_if_possible!(r, way[1]), get_num_movements_if_possible!(r, way[2]))


function m__x(r::Robot)
    sud = 0
    west = 0
    sud, west = get_num_movements_if_possible!(r, (Sud, West))
    for way in ((Nord, Ost), (Sud, Ost), (Nord, West), (Sud, West))
        move_and_putmarkers_diagonal!(r,way)
        return_back!(r, way)
    end
    while isborder(r, (Sud, West)) == false
        move_diagonal!(r, (Sud, West))
    end
    movements_if_possible!(r, inverse(Sud), sud)
    movements_if_possible!(r, inverse(West), west)
end


function return_back!(r::Robot, way::NTuple{2,HorizonSide}) 
    for _ in 1:5
        move_diagonal!(r, inverse(way))
    end
end
function move_diagonal!(r::Robot, way::NTuple{2,HorizonSide})
    move!(r, way[1])
    move!(r, way[2])
end

function move_and_putmarkers_diagonal!(r::Robot, way::NTuple{2, HorizonSide})
    while isborder(r, way) == false
        putmarker!(r)
        move_diagonal!(r, way)
        putmarker!(r)
        
    end
end

m__x(r)