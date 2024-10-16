{% macro filter_nulls(table, columns) %}
    SELECT *
    FROM {{ table }}
    WHERE 
        {% for column in columns %}
            {{ column }} IS NOT NULL
            {% if not loop.last %} AND {% endif %}
        {% endfor %}
{% endmacro %}
