include("../roblib.jl")

function  m_chess(r)
    steps = through_rectangles_into_angle(r, (Sud, West))
    way = Ost
    flag = true
    step = 0
    while (flag == true)
        step+=1
        movements_if_possible!(r,way,1)
        if ((-1)^step == -1)
           putmarker!(r)
        end
        if isborder(r, way)
            way = inverse(way)
            if (isborder(r, Nord) == false)
               move!(r, Nord)
               step+=1
            else
                break
            end
        end
    end
    through_rectangles_into_angle(r, (Sud, West))
    movements!(r, (Nord, Ost), reverse(steps))
end
m_chess(r)