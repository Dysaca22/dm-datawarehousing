{% macro normalize_text(column, case_type='upper') %}
    -- Reemplaza tildes y caracteres especiales
    {% set text_column = "TRANSLATE(" ~ column ~ ", 'áéíóúÁÉÍÓÚñÑ', 'aeiouAEIOUnN')" %}
    
    -- Definir qué tipo de caso se quiere (mayúsculas, minúsculas, etc.)
    {% if case_type == 'upper' %}
        UPPER({{ text_column }})
    {% elif case_type == 'lower' %}
        LOWER({{ text_column }})
    {% elif case_type == 'title' %}
        INITCAP({{ text_column }})
    {% else %}
        {{ text_column }}  -- Por defecto devuelve el texto sin cambios en el caso
    {% endif %}
{% endmacro %}
