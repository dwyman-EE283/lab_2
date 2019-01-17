main <- function() {

    load_packages()
    opt <- parse_options()
    indir <- opt$indir
    outdir <- opt$outdir

    files <- list.files(indir)
    for (infile in files ){
        string_parts <- str_split(infile, pattern = "\\.")[[1]]
        string_parts[1] <- "outfile"
        string_parts[length(string_parts)] <- "out"
       
        expected_outfile <- paste(outdir, "/", paste(string_parts, 
                                                     collapse="."),sep="")
        if(!file.exists(expected_outfile)) {
            print(expected_outfile)
        }
    }
}

parse_options <- function() {

    option_list <- list(
        make_option(c("--f"), action = "store", dest = "indir",
                    default = NULL, help = "Input directory"),
        make_option(c("--o"), action = "store", dest = "outdir",
                    default = NULL, help = "Output directory")
        )

    opt <- parse_args(OptionParser(option_list=option_list))
    return(opt)
}

load_packages <- function() {
    suppressPackageStartupMessages(library("stringr"))
    suppressPackageStartupMessages(library("optparse"))
    return
}


main()
