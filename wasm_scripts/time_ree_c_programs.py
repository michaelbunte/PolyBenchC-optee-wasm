import os
import subprocess
import time
import argparse

def run_and_time_binary(path):
    start = time.perf_counter()
    try:
        result = subprocess.run([path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        end = time.perf_counter()
        return end - start, result.returncode
    except Exception as e:
        return None, str(e)

def main(directory):
    if not os.path.isdir(directory):
        print(f"Error: {directory} is not a valid directory.")
        return

    binaries = [os.path.join(directory, f) for f in os.listdir(directory)
                if os.path.isfile(os.path.join(directory, f)) and os.access(os.path.join(directory, f), os.X_OK)]

    if not binaries:
        print("No executables found.")
        return

    for binary in sorted(binaries):
        duration, result = run_and_time_binary(binary)
        if duration is not None:
            print(f"{os.path.basename(binary):<30} ran in {duration:.6f} seconds, return code {result}")
        else:
            print(f"{os.path.basename(binary):<30} failed to run: {result}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run and time all executables in a directory.")
    parser.add_argument("directory", help="Path to the directory containing the binaries.")
    args = parser.parse_args()
    main(args.directory)
