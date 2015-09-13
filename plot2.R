plot2 <- function() {
        # data source: Electric power consumption from  UCI Machine Learning Repository
        # assume file "household_power_consumption.tex" already in the working dir
        
        # only load dataset between 2007-02-01 and 2007-02-02
        # to compute nrows and skip, use readLines to read first several lines.
        # find start date at line 2, store as d1. (load lubricate library and use dmy_hms)
        # set date 2007-02-01 00:00:00 to be d2; d3 <- d2 + days(2)
        # skip = difftime(d2, d1, units="mins") + 1
        # nrows = difftime(d3, d2, units="mins")
        
        dat <- read.table("./household_power_consumption.txt", header = FALSE, 
                          sep=";", nrows = 2880, skip = 66637)
        name <- readLines("./household_power_consumption.txt", 1)
        var <- strsplit(name, ";")[[1]]
        colnames(dat) <- var
        
        # convert the Date and Time variables to Date/Time classes
        tmp <- paste(as.character(dat$Date),as.character(dat$Time))
        datetime <- strptime(tmp, "%d/%m/%Y %H:%M:%S")
        
        # plot Global active power againt datetime
        png(filename = "plot2.png", width = 480, height = 480)
        plot(datetime, dat$Global_active_power, type = "l", 
             xlab = "" , ylab = "Global Active Power (kilowatts)")
        dev.off()
}