import os
import subprocess
from pathlib import Path

def main():
    # Paths
    top_dir = Path(__file__).resolve().parents[1]
    wasm_scripts = top_dir / "wasm_scripts"
    programs_list = wasm_scripts / "program_dirs"
    binary_output = wasm_scripts / "ree_c_binaries"

    # Ensure output directory exists
    binary_output.mkdir(parents=True, exist_ok=True)

    # Clear existing binaries
    for f in binary_output.iterdir():
        if f.is_file():
            f.unlink()

    # Run header and makefile generators
    utilities = top_dir / "utilities"
    subprocess.run(["./clean.pl", str(top_dir)], cwd=utilities, stderr=subprocess.DEVNULL)
    subprocess.run(["./header-gen.pl", str(top_dir)], cwd=utilities)
    subprocess.run(["./makefile-gen.pl", str(top_dir), "-cfg"], cwd=utilities)

    # Compile and move binaries
    with open(programs_list) as f:
        for line in f:
            rel_path = line.strip()
            dir_path = top_dir / rel_path

            if not dir_path.is_dir():
                print(f"Warning: {rel_path} is not a directory")
                continue

            print(f"Building in {rel_path}")
            subprocess.run(["make"], cwd=dir_path)

            binary_name = dir_path.name
            binary_path = dir_path / binary_name

            if binary_path.is_file():
                binary_path.rename(binary_output / binary_name)
            else:
                print(f"Warning: binary '{binary_name}' not found in {rel_path}")

if __name__ == "__main__":
    main()
