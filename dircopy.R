
dir.copy = function(from, to, checkto= TRUE, 
                    overwrite=FALSE, 
                    recursive=FALSE, ...) {
  if (!dir.exists(from)) {
    cat('Directory', from, 'DOES NOT exist.
')
    stop()
  }
  
  if (checkto == TRUE) {
    if (dir.exists(to)) {
      cat('Directory', to, 
          'exists. checkto=FALSE to copy files to the EXISTING directory.
')
      stop() } 
  } else {
    if (!dir.exists(to)) dir.create(to)
  }
  
  if (length(list.files(from, recursive=recursive, ...))==0) {
    error('No files to be copied')
  } else {
    file.copy(from=from, to=to, 
              overwrite=overwrite, 
              recursive=recursive, ...)
  }
}

