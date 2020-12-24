include("../roblib.jl")

function m_angle(r)
    step = through_rectangles_into_angle(r, (Sud, West))
    """
    кол-во шагов до юго-запада и переход в юго-запад 
    """ 
    putmarker!(r)
    """
    доходим до верха through_rectangles_into_angle(r, (Nord, West))
    """
    through_rectangles_into_angle(r, (Nord, West))
    putmarker!(r)
    through_rectangles_into_angle(r, (Nord, Ost))
    putmarker!(r)
    through_rectangles_into_angle(r, (Sud, Ost))
    putmarker!(r)
    through_rectangles_into_angle(r, (Sud, West))
    """
    возвращаемся на исходное положение
    """
    movements_if_possible!(r, (Nord, Ost), reverse(step))
end
m_angle(r)