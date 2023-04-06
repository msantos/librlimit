#!/usr/bin/env bats

@test "librlimit: disable fd: use stdio" {
  run sh -c "echo test | LD_PRELOAD=librlimit.so RLIMIT_NOFILE=0 RLIMIT_FSIZE=0 sed 's/t/_/g'"

  expected="_es_"

  cat <<EOF
--- output
$output
--- expected
$expected
EOF

  [ "$status" -eq 0 ]
  [ "$output" = "$expected" ]
}

@test "librlimit: disable fd: write to file" {
  TMPFILE="$(mktemp)"
  run sh -c "LD_PRELOAD=librlimit.so RLIMIT_NOFILE=0 RLIMIT_FSIZE=0 sed 's/t/_/g' </etc/hosts >$TMPFILE"

  expected="File size limit exceeded (core dumped)"

  cat <<EOF
--- output
$output
--- expected
$expected
EOF

  [ "$status" -ne 0 ]
  [ "$output" = "$expected" ]
}
