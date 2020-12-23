include("../roblib.jl")



function mark_kross(r)
    way = Ost
    for i in 0:1:3
        steps = 0
        while isborder(r,way)==false
            move!(r,way)
            putmarker!(r)
            steps += 1
        end
        movements!(r, inverse(way), steps)
        way = left(way)
    end
    putmarker!(r)
end
mark_kross(r)