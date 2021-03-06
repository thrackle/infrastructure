- name: etcd.service
  mask: true

# Robins Etcd Proxy
# Provides a local loop back to the etcd services running on the core
- name: robins_etcdproxy.service
  command: start
  content: |
    [Unit]
    Description=proxy for etcd
    Requires=docker.service
    After=docker.service
    Wants=network-online.target
    After=network-online.target

    [Service]
    TimeoutStartSec=0
    SyslogIdentifier=robins_etcd_proxy
    ExecStartPre=-/usr/bin/docker kill etcd_proxy
    ExecStartPre=-/usr/bin/docker rm etcd_proxy
    ExecStartPre=/bin/sh -c "docker history jwaldrip/robins:latest >/dev/null || docker pull jwaldrip/robins:latest"
    ExecStart=/bin/bash -c "/usr/bin/docker run -d --net host --name etcd_proxy jwaldrip/robins etcd.brandfolder.host 4001"

    RestartSec=5
    Restart=always

- name: deis-preseed.service
  drop-ins:
    - name: 00-set-deis-components.conf
      content: |
        [Service]
        Environment="DEIS_COMPONENTS=logspout publisher"

${file("conf/shared/robins.yml")}
