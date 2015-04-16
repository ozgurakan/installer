{#include:
  - mysql_server.install
#}

mysql_start:
  cmd:
    - run
{%- if 'cluster-id' in grains -%}
{%-   for key, value in salt ['mine.get']('G@cluster-id:' + grains['cluster-id'] + ' and G@role:mysql', 'grains.items','compound').items() -%}
{%-     if value.id == grains['id'] and grains['mysql-is-master'] == True %}
    - name: service mysql start --wsrep-new-cluster
{%-     elif  value.id == grains['id'] and grains['mysql-is-master'] == False %}
    - name: service mysql start
{%-     endif -%}
{%-   endfor -%}
{%- else %}
    - name: service mysql start
{%- endif %}
{#    - require:
      - pkg: mysql_install
#}
