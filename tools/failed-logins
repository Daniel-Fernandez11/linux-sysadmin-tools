#!/bin/bash

# failed-logins
# Detect failed login attempts (SSH)

# Check dependencies

check_dependencies() {

    for cmd in grep awk sort uniq head; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            echo "ERROR: required command '$cmd' not found"
            exit 1
        fi
    done

}

# Detect log source

detect_log_source() {

    if [ -f "/var/log/auth.log" ]; then
        LOG_SOURCE="/var/log/auth.log"
        MODE="file"
    else
        MODE="journal"
    fi

}

# Get failed logins

get_failed_logins() {

    if [ "$MODE" = "file" ]; then
        grep "Failed password" "$LOG_SOURCE"
    else
        journalctl -u ssh 2>/dev/null | grep "Failed password"
    fi

}

# Show failed attempts

show_failed_attempts() {

    echo "FAILED LOGIN ATTEMPTS"
    echo "--------------------------------"

    logs=$(get_failed_logins)

    if [ -z "$logs" ]; then
        echo "No failed login attempts found"
    else
        echo "$logs" | tail -n 10
    fi

}

# Top attacking IPs

show_top_ips() {

    echo ""
    echo "TOP OFFENDING IPs"
    echo "--------------------------------"

    logs=$(get_failed_logins)

    if [ -z "$logs" ]; then
        echo "No failed login attempts found"
        return
    fi

    echo "$logs" | awk '{for(i=1;i<=NF;i++) if ($i=="from") print $(i+1)}' \
        | sort | uniq -c | sort -nr | head -n 5 \
        | awk '{printf "%-15s → %s attempts\n", $2, $1}'

}

# Filter by threshold

filter_by_attempts() {

    threshold=$1

    echo ""
    echo "IPs with more than $threshold failed attempts"
    echo "--------------------------------"

    logs=$(get_failed_logins)

    if [ -z "$logs" ]; then
        echo "No failed login attempts found"
        return
    fi

    echo "$logs" | awk '{for(i=1;i<=NF;i++) if ($i=="from") print $(i+1)}' \
        | sort | uniq -c \
        | awk -v t="$threshold" '$1 > t {printf "%-15s → %s attempts\n", $2, $1}'

}

# Main

main() {

    check_dependencies
    detect_log_source

    case "$1" in

        --top)
            show_top_ips
            ;;

        --threshold)
            if [ -z "$2" ]; then
                echo "Usage: failed-logins --threshold <number>"
                exit 1
            fi
            filter_by_attempts "$2"
            ;;

        *)
            show_failed_attempts
            show_top_ips
            ;;

    esac

}

main "$@"
