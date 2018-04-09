{%- from "php/map.jinja" import php with context %}

include:
  - php

php-opcache:
  pkg.installed:
    - name: {{ php.opcache_pkg }}

{{ php.ext_conf_path }}/opcache-size.ini:
  file.managed:
    - source: salt://php/files/opcache-size.ini.jinja
    - mode: 644
    - template: jinja
    - require:
      - pkg: apache
    - watch_in:
      - module: apache-restart

