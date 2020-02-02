#! /bin/sh

### BEGIN INIT INFO
# Provides:          shutdown-signal.py
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
### END INIT INFO

# If you want a command to always run, put it here

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting shutdown-signal.py"
    /usr/local/bin/shutdown-signal.py &
    ;;
  stop)
    echo "Stopping shutdown-signal.py"
    pkill -f /usr/local/bin/shutdown-signal.py
    ;;
  start)
    echo "Restarting shutdown-signal.py"
    pkill -f /usr/local/bin/shutdown-signal.py
    /usr/local/bin/shutdown-signal.py &
    ;;
  *)
    echo "Usage: /etc/init.d/shutdown-signal.sh {start|stop|restart}"
    exit 1
    ;;
esac

exit 0