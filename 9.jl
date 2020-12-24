include("../roblib.jl")

function find_m(r)
    way = Ost
    flag = false
    through_rectangles_into_angle(r, (Sud, West))
    if ismarker(r) == false
        while flag==false
            while isborder(r,way)==false
                if ismarker(r) == false
                    move!(r, way)
                end
                if ismarker(r) == true
                    break
                end
            end
            if ismarker(r) == false
                way = inverse(way)
                move!(r, Nord)
            end
            if ismarker(r) == true
                flag = true
            end
        end
    end
end
find_m(r)