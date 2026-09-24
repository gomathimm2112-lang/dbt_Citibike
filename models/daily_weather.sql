WITH daily_weather AS(
    SELECT 
    DATE(TIME) AS daily_weather,
    weather,
    TEMP,
    PRESSURE, 
    HUMIDITY,
    CLOUDS

    FROM 
    {{ source('demo', 'weather') }}

),

daily_weather_agg AS (
    SELECT 
    daily_weather,
    weather,
    round(avg(TEMP), 2) AS AVG_TEMP,
    round(AVG(PRESSURE), 2) AS AVG_PRESSURE, 
    round(AVG(HUMIDITY), 2) AS AVG_HUMIDITY,
    round(AVG(CLOUDS),2) AS AVG_CLOUDS


    FROM daily_weather

    GROUP BY daily_weather,weather

    QUALIFY ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY COUNT(weather) DESC) = 1
)

SELECT * FROM daily_weather_agg