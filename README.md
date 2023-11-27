# Disfluency Detection From Audio 

This repo is a fork from https://github.com/amritkromana/disfluency_detection_from_audio. We thank the authors for their work. This fork was necessary to fix some bugs and optimize the execution.
With the scripts contained in the repo, you can run audio through some pre-trained language, acoustic, and multimodal disfluency detection models - with disfluency labels (filled pauses, partial words, repetitions, revisions, and restarts) at the frame level (every 20ms of audio). 

# Instructions

## Setup
1. Make ```setup_env.sh``` executable:
   ````chmod +x ```setup_env.sh````
2. Run it with your desired environment name:
   ````./setup_env.sh <myenv> <path_to_conda>````
   You can pick the ```<myenv>``` that you like.
   You can get``` <path_to_conda>``` by running ```conda info``` (assiming ```conda``` is installed).
The script ```./setup_env.sh``` checks if the specified conda environment exists and creates it if it doesn't. It then activates the environment, installs the required python packages from requirements.txt, and sets up the demo_models directory with the necessary files.

## Quick start
Once the environment is ready, you can 

1. Activate it with
   ```conda activate <myenv>```

2. Look for disfluencies with specific models and in a specific .wav file with the following commands:
  ````
  python3 demo.py --audio_file demo_data/stutter-i-love-you.wav --output_file demo_data/output_language.csv --modality language
  python3 demo.py --audio_file demo_data/stutter-i-love-you.wav --output_file demo_data/output_acoustic.csv --modality acoustic
  python3 demo.py --audio_file demo_data/stutter-i-love-you.wav --output_file demo_data/output_multimodal.csv --modality multimodal
  ````
  The ``language`` option runs a Whisper model that's been fine-tuned for verbatim transcription, and then uses the text + timestamps as input to a BERT model that's been fine-tuned for disfluency detection.
  The ``acoustic`` option runs a WavLM model that's been fine-tuned for acoustic-based disfluency detection. 
  The ``multimodal`` option runs the language and acoustic models, concatenates their embeddings, and runs them through a BLSTM fusion model. 
  The frame-level disfluency predictions will be printed to the .csv files. 

3. Look for disfluencies with all available models in all .wav files in a given folder
   - Make ```run.sh``` executable:
   ````chmod +x run.sh````
   - Run the script:
    ````run.sh demo_data````

# Citation 
The original work has been submitted to IEEE Transactions on Audio, Speech, and Language Processing. You can cite it as follows:
```
@article{romana2023,
title = {Automatic Disfluency Detection from Untranscribed Speech},
author = {Amrit Romana, Kazuhito Koishida, Emily Mower Provost},
year = {2023}
}
```
