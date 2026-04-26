#!/bin/sh
# Wait for SAGE to be resolvable and healthy if SAGE is enabled
if [ "$SAGE_ENABLED" = "true" ]; then
    echo "Waiting for SAGE to be available at $SAGE_URL..."
    for i in $(seq 1 60); do
        if wget -q --tries=1 --spider "$SAGE_URL/health"; then
            echo "SAGE is ready."
            break
        fi
        echo "SAGE not ready, waiting... ($i/60)"
        sleep 5
    done
fi

# Run the original pentagi command
exec /opt/pentagi/bin/pentagi
