str_reverse <- function(x) {
  purrr::map_chr(stringr::str_split(x, ""),
                 ~ stringr::str_flatten(rev(.x))
  )
}
