% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{try_later_if_fail}
\alias{try_later_if_fail}
\title{Retry Function Execution with Delay on Failure}
\usage{
try_later_if_fail(fun, args, max_tries = 5, sleep_time)
}
\arguments{
\item{fun}{A function to be executed.}

\item{args}{A named list of arguments to pass to the function.}

\item{max_tries}{Integer. Maximum number of attempts before giving up.}

\item{sleep_time}{Numeric. Time (in seconds) to wait between retries.}
}
\value{
The result of the successful function execution.
If all attempts fail, the function throws an error.
}
\description{
Attempts to execute a given function with specified arguments. If the function
fails (throws an error), it retries the execution up to \code{max_tries} times,
waiting \code{sleep_time} seconds between each attempt.
}
\examples{
\dontrun{

url <- "https://amtsblattportal.ch/api/v1/publications/xml?"

params <- list(
  publicationStates = "PUBLISHED",
  rubrics = "BP-ZH",
  subrubrics = "BP-ZH01",
  publicationDate.start = start,
  publicationDate.end = as.character(Sys.Date()),
  cantons = "ZH",
  pageRequest.size = page_size
  )

new_url <- try_later_if_fail(fun = get_new_pub_url,
                             args = list(page_size = page_size,
                             url = url,
                             params = params, 
                             df_bp = df_bp), 
                             max_tries = 2, 
                             sleep_time = 3600)
}
}
