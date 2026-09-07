default: serve

serve port="8000":
    #!/usr/bin/env bash
    PIDS=$(lsof -ti :{{port}} 2>/dev/null)
    if [ -n "$PIDS" ]; then
        echo "Killing existing process(es) on port {{port}} ($PIDS)..."
        echo "$PIDS" | xargs kill -9 2>/dev/null
        sleep 0.5
    fi
    echo "Serving learn-attention at http://localhost:{{port}}"
    python3 -m http.server {{port}}

kill port="8000":
    #!/usr/bin/env bash
    PIDS=$(lsof -ti :{{port}} 2>/dev/null)
    if [ -n "$PIDS" ]; then
        echo "Killing process(es) on port {{port}} ($PIDS)..."
        echo "$PIDS" | xargs kill -9 2>/dev/null
        echo "Port {{port}} is now free."
    else
        echo "No process running on port {{port}}."
    fi

alias s := serve
alias server := serve
alias k := kill
