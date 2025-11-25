#!/usr/bin/env bash
set -euo pipefail

if [[ ! -x "./test_install.sh" ]]; then
	echo "Error: mandatory test ./test_install.sh is missing or not executable" >&2
	exit 1
fi

echo "Running installation test..."
./test_install.sh

echo
echo "Running additional tests..."

overall_status=0

for test_file in test_*.sh; do
	# Skip the installation test as it has already been run
	if [[ "$test_file" == "test_install.sh" ]]; then
		continue
	fi

	if [[ ! -x "$test_file" ]]; then
		echo "$test_file: SKIPPED (not executable)"
		overall_status=1
		continue
	fi

	echo "Running $test_file..."
	if "./$test_file"; then
		echo "$test_file: OK"
	else
		echo "$test_file: FAILED"
		overall_status=1
	fi
	echo
done

exit "$overall_status"
