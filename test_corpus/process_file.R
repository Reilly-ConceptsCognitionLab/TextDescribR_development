process_file <- function(data, filename) {
  
  ID <- str_replace(filename, pattern = "_clean", replacement = "")
  ID <- str_replace(ID, pattern = "A", replacement = "")
  
  speaker_str <- data %>%
    dplyr::summarize(speakers = first(speaker)) %>%
    pull(1)
  
  data_prep <- data %>%
    mutate(speaker = ID) %>%
    select(-score)
  
  time_start <- data_prep$start[1]
  time_end <- data_prep$end[nrow(data_prep)]
  
  time_taken <- time_end - time_start
  
  data_processed <- data_prep %>%
    mutate(duration = time_taken) %>%
    dplyr::summarize(words = paste(word, collapse = " "),
              duration = unique(duration),
              ID = unique(ID))
  
  return(data_processed)
  
  
  
  
  
  
}