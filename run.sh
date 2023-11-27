#!/bin/bash

# Check if folder path is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

FOLDER=$1

# Create output directories
mkdir -p "${FOLDER}_language"
mkdir -p "${FOLDER}_acoustic"
mkdir -p "${FOLDER}_multimodal"

# Loop through all .wav files in the given folder
for file in "$FOLDER"/*.wav; do
    FILENAME=$(basename "$file" .wav)

    echo "Processing: $FILENAME"

    # Execute the Python commands for each modality
    python3 demo.py --audio_file "$FOLDER/$FILENAME.wav" --output_file "${FOLDER}_language/$FILENAME.csv" --modality language
    python3 demo.py --audio_file "$FOLDER/$FILENAME.wav" --output_file "${FOLDER}_acoustic/$FILENAME.csv" --modality acoustic
    python3 demo.py --audio_file "$FOLDER/$FILENAME.wav" --output_file "${FOLDER}_multimodal/$FILENAME.csv" --modality multimodal
done

echo "Processing complete."

