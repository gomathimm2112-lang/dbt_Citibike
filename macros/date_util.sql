{% macro get_season(x)%}
    case when month(TO_TIMESTAMP({{x}})) in (12,1,2)
        then 'WINTER'
        when month(TO_TIMESTAMP({{x}})) in (3,4,5)
        then 'SPRING'
        when month(TO_TIMESTAMP({{x}})) in (6,7,8)
        then 'SUMMER'
        else 'AUTUMN'
        end 
{% endmacro %}