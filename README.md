Test for [Audiobooks for Quarto](https://github.com/rstats-gsoc/gsoc2024/wiki/Audiobooks-for-quarto) as part of Google Summer Of Code 2024 

Test Completion:
- Easy:
  - Create the quarto book: (Quarto Book)[http://qngyn.me/gsoc_quarto/]
    - To run/render it locally on your machine, please fetch the repo and run `quarto render` in the terminal
- Medium:
  - Convert quarto file to Audio: [Function](https://github.com/qngyn/gsoc_quarto/blob/main/convertQuartoToAudio.R):
    - This function will take a quarto file path, API key, language, and audio format to convert the information in the given quarto file to audio via VoiceRSS API.
