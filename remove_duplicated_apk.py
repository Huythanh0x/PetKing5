import os
import subprocess

def analyze_apks(apk_directory, output_directory):
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    for root, dirs, files in os.walk(apk_directory):
        for file in files:
            if file.endswith(".apk"):
                apk_path = os.path.join(root, file)
                output_path = os.path.join(output_directory, os.path.splitext(file)[0])
                if not os.path.exists(output_path):
                    os.makedirs(output_path)
                run_jadx(apk_path, output_path)
                # break

def run_jadx(apk_path, output_path):
    try:
        subprocess.run(["jadx", "-d", output_path, "--export-gradle", apk_path], check=True)
        print(f"Successfully decompiled {apk_path} to {output_path}")
    except subprocess.CalledProcessError as e:
        print(f"Error decompiling {apk_path}: {e}")

if __name__ == "__main__":
    apk_directory = "all_other_apks"
    output_directory = "decompiled_apks"
    analyze_apks(apk_directory, output_directory)