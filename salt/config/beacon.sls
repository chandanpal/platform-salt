{% set roles = salt['grains.get']('roles', '') %}
config-beacon_create_conf_file:
  file.managed:
    - name: /etc/salt/minion.d/beacons.conf
    - contents: 
      - "beacons:"
{% if 'hadoop_manager' in roles %}
      - "  hadoop_service:"
      - "    interval: 30"
      - "    disable_during_state_run: True"
{% endif %}
{% if 'opentsdb' in roles %}
      - "  service_opentsdb:"
      - "    interval: 30"
      - "    disable_during_state_run: True"
{% endif %}
