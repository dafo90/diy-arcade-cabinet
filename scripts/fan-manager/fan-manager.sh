#! /bin/sh

### BEGIN INIT INFO
# Provides:          fan-manager.py
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
### END INIT INFO

# If you want a command to always run, put it here

# Carry out specific functions when asked to by the system
case "$1" in
  start)
    echo "Starting fan-manager.py"
    /usr/local/bin/fan-manager.py &
    ;;
  stop)
    echo "Stopping fan-manager.py"
    pkill -f /usr/local/bin/fan-manager.py
    ;;
  start)
    echo "Restarting fan-manager.py"
    pkill -f /usr/local/bin/fan-manager.py
    /usr/local/bin/fan-manager.py &
    ;;
  *)
    echo "Usage: /etc/init.d/fan-manager.sh {start|stop|restart}"
    exit 1
    ;;
esac

exit 0