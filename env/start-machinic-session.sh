
        #!/bin/bash
        echo "consul and nomad will run in background"
        echo "but will not be configured as service"

        # use env "PATH=$PATH" with sudo for
        # programs in /usr/local/bin

        sudo mkdir /var/lib/nomad/data/ -p
        sudo sudo cp nomad_config.hcl /usr/local/etc/
        env "PATH=$PATH" consul agent -dev -bootstrap-expect=1 &
        sudo env "PATH=$PATH" nomad agent -server -config=/usr/local/etc/nomad_config.hcl -bootstrap-expect=1 -bind='{{ GetPrivateIP }}' &
    