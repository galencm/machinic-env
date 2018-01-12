
        #!/bin/bash
        echo "consul and nomad will run in background"
        echo "but will not be configured as service"

        sudo mkdir /var/lib/nomad/data/ -p
        sudo sudo cp nomad_config.hcl /usr/local/etc/
        consul agent -dev  &
        sudo /usr/local/bin/nomad agent -server -dev -config=/usr/local/etc/nomad_config.hcl -bind=localhost &
    