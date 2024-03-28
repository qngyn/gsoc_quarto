params <- readRDS("pre_render_params.RDS")

source("convertQuartoToAudio.R")

for (quarto_file in params$quarto_files) {
  convert_quarto_to_audio(quarto_file, api_key = params$api_key, language = params$language, sample_rate = params$sample_rate)
}

