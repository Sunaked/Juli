include("../roblib.jl")

function labirinth(r)

    flag = false
    mark = false
    """
    ротация направления
    """
    way = Ost
    while mark == false
        while isborder(r, way)
            way = left(way)
        end
        if flag == false
            putmarker!(r)
            flag = true
            move!(r, way)
        end
        while mark == false
            if ismarker(r) == false
                if isborder(r, right(way))
                    if isborder(r, way)
                        way = left(way)
                    else
                        move!(r, way)
                    end
                else
                    move!(r, right(way))
                    way = right(way)
                end
            else
                mark = true
            end
        end
    end
end
labirinth(r)