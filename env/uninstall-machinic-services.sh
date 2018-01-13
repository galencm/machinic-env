
        #!/bin/bash
        echo "removing systemd services for"
        echo "consul and nomad"

        services=("nomad" "consul")

        for service in "${services[@]}" ; do
            systemctl stop $service
            systemctl disable $service
            rm /etc/systemd/system/$service.service
        done

        systemctl daemon-reload
        systemctl reset-failed
    