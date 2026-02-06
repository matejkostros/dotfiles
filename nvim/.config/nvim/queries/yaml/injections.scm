; Jinja2 variable interpolation {{ ... }}
(block_mapping_pair
  value: (flow_node) @content
  (#match? @content "{{.*}}")
  (#set! injection.language "jinja"))

; Jinja2 statements {% ... %}
(block_mapping_pair
  value: (flow_node) @content
  (#match? @content "{%.*%}")
  (#set! injection.language "jinja"))

; Jinja2 in string values
(block_mapping_pair
  value: (scalar) @content
  (#match? @content ".*{{.*}}.*")
  (#set! injection.language "jinja"))

(block_mapping_pair
  value: (scalar) @content
  (#match? @content ".*{%.*%}.*")
  (#set! injection.language "jinja"))
