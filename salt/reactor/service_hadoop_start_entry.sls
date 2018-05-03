reactor-hadoop_service_start:
  local.state.sls:
    - arg:
      #- hadoop_service.startservice
      - reactor.hadoop_service
    - tgt: {{ data['data']['id'] }}
    - timeout: 120
    - queue: True
