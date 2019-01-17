from optparse import OptionParser
import glob
import os

def getOptions():
    parser = OptionParser()
    parser.add_option("--f", dest = "indir", help = "Directory containing input files",
                      type = "string")
    parser.add_option("--o", dest = "outdir",
                      help = "Directory containing output files", type = "string")
    (options, args) = parser.parse_args()
    return options

def main():
    options = getOptions()

    indir = options.indir
    if not indir.endswith("/"):
        indir = indir + "/"
    outdir = options.outdir
    if not outdir.endswith("/"):
        outdir = outdir + "/" 

    for infile in glob.glob(indir + "*"):
        pattern = os.path.basename(infile).split(".")
        pattern[0] = "outfile"
        pattern[-1] = "out"
        expected_outfile = outdir  + ".".join(pattern)
        
        if not os.path.exists(expected_outfile):
            print expected_outfile

if __name__ == '__main__':
    main()

