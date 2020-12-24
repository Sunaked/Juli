include("../roblib.jl")


function find_gap(r)
    way = Ost
    gap = false
    while gap == false
        if isborder(r, Nord)
            movements_if_possible!(r, way)
            if isborder(r, Ost)
                way = West
            end
            if isborder(r, West)
                way = Ost
            end
            while (isborder(r,Nord))
                move!(r, way)
            end
            gap = true
        end
        if gap == false
            movements_if_possible!(r, inverse(way))
            if isborder(r,Nord)
                while (isborder(r,Nord))
                    move!(r, way)
                end
                gap = true
            end
        end
        
        if gap == false
            if isborder(r, Nord)==false
                while isborder(r, Nord)==false
                    while isborder(r, way)==false
                        move!(r, way)
                    end
                    way = inverse(way)
                    if isborder(r, Nord) == false
                        move!(r, Nord)
                    end
                    move!(r, way)
                end
            end

        end
    end
end
find_gap(r)
    
    
