convert_quarto_to_audio <- function(quarto_file_path, api_key, language, sample_rate) {
  # Load required libraries
  library(httr)
  
  # Read Quarto file
  quarto_content <- readLines(quarto_file_path)
  
  # Concatenate all lines of the Quarto file into a single string
  quarto_text <- paste(quarto_content, collapse = "\n")
  quarto_text <- gsub("#", "", quarto_text)
  
  # Call Text-to-Speech API
  endpoint <- "http://api.voicerss.org/"
  params <- list(key = api_key, src = quarto_text, hl = language, c = "MP3", f = sample_rate)
  response <- POST(endpoint, body = params)
  
  # Check for errors in API response
  if (http_error(response)) {
    stop("Error:", content(response, "text"))
  }
  
  # Generate output filename based on input filename
  input_filename <- basename(quarto_file_path)
  output_filename <- gsub("\\.qmd$", ".mp3", input_filename)  # Replace .qmd extension with .mp3
  
  # Save audio file
  output_path <- file.path("~/Documents/GSoC'24", output_filename)
  writeBin(content(response, "raw"), output_path)
  cat("Audio file saved:", output_path, "\n")
}

