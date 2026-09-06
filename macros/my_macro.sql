{% macro get_session(x) %}

    case
        when month(TO_TIMESTAMP({{x}})) in (12,1,2) then 'winter'
        when month(TO_TIMESTAMP({{x}})) in (3,4,5) then 'spring'
        when month(TO_TIMESTAMP({{x}})) in (12,1,2) then 'summer' else 'autumn' 
    end

{% endmacro %}


{% macro Day_type(x) %}

case
    when DAYNAME(TO_TIMESTAMP({{ x }})) in ('sat', 'sun')
        then 'Weekend'
    else 'weekdays'
end

{% endmacro %}