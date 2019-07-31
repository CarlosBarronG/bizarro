bizarro<-function(x){
  print(x)
  if(is.character(x)){
     str_reverse(x)
  }else if (is.numeric(x)){
    -x
  }else if (is.logical(x)){
    !x
  } else if (is.factor(x)) {
    as.character(x) %>% str_reverse()
  } else if (is.data.frame(x)){
    names(x) <- bizarro(names(x))
     x[] <- purrr::map(x, bizarro)
    x
    # str_reverse(as.character(x[]))
    # str_reverse(as.character(colnames(x)))
  }else
    stop(
      "Don't know how to make bizzaro <", class(x)[[1]], ">",
      call. = FALSE)
}
