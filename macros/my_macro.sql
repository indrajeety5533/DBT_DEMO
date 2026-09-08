{% macro get_session(x) %}

    case
        when month(to_timestamp({{ x }})) in (12, 1, 2) then 'winter'
        when month(to_timestamp({{ x }})) in (3, 4, 5) then 'spring'
        when month(to_timestamp({{ x }})) in (6, 7, 8) then 'summer'
        else 'autumn'
    end

{% endmacro %}



{% macro Day_type(x) %}

    case
        when dayname(to_timestamp({{ x }})) in ('Sat', 'Sun')
            then 'Weekend'
        else 'Weekday'
    end

{% endmacro %}