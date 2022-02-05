librlimit
=========

librlimit: rlimit sandbox for any process

# EXAMPLES

    $ LD_PRELOAD=librlimit.so RLIMIT_FSIZE=0 yes > test
    File size limit exceeded (core dumped)

    $ LD_PRELOAD=./librlimit.so RLIMIT_NPROC=0 sh -c "sleep 60 & sleep 60 & sleep 60 & sleep 60"
    sh: 0: Cannot fork

# ENVIRONMENT VARIABLES

LIBRLIMIT_OPT
: set options for the library behaviour (default: 2)

      0: no options enabled
      1: exit with status 111 if setting rlimit fails
      2: enable debug
      3: exit on failure and debug enabled

Supported resources are platform dependent. See `setrlimit(3)`.

RLIMIT_AS
: maximum size of process' virtual memory (address space)

RLIMIT_CORE
: maximum size of a core file

RLIMIT_CPU
: limit in seconds on CPU time

RLIMIT_DATA
: maximum size of the process' data segment

RLIMIT_FSIZE
: maximum file size in bytes

RLIMIT_LOCKS
: limits the number of `flock(2)` locks and `fcntl(2)` leases

RLIMIT_MEMLOCK
: maximum number of bytes available to be locked into memory

RLIMIT_MSGQUEUE
: maximum of bytes allocated for POSIX message queues

RLIMIT_NICE
: limits priority of process

RLIMIT_NOFILE
: maximum number of file descriptors

RLIMIT_NPROC
: maximum number of processes

RLIMIT_RSS
: maximum number of bytes for a process resident set size

RLIMIT_RTPRIO
: maximum real-time priority of process

RLIMIT_RTTIME
: limit in microseconds for real-time scheduled CPU time

RLIMIT_SIGPENDING
: maximum number of queued signals

RLIMIT_STACK
: maximum size of process stack
