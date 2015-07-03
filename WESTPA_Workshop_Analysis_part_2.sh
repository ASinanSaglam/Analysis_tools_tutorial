# Created by: Ali Sinan Saglam
# For 2015 WESTPA Workshop, on analysis tools 

### Variables ### 
# Set all your variables here if you didn't go with 
# the default settings 
H5FILE='west.h5'
BINFILE='BINS.yaml'
STATEFILE='STATES.yaml'


### Part 2: Rate constant calculations ### 

# Assingment tool
# Bin and state definition yaml file 
# w_assign

# usage: w_assign [-h] [-r RCFILE] [--quiet | --verbose | --debug] [--version]
#                [--max-queue-length MAX_QUEUE_LENGTH] [-W WEST_H5FILE]
#                [--bins-from-system | --bins-from-expr BINS_FROM_EXPR | --bins-from-function BINS_FROM_FUNCTION | --bins-from-file BINFILE]
#                [--construct-dataset CONSTRUCT_DATASET | --dsspecs DSSPEC [DSSPEC ...]]
#                [--states STATEDEF [STATEDEF ...] | --states-from-file
#                STATEFILE | --states-from-function STATEFUNC] [-o OUTPUT]
#                [--serial | --parallel | --work-manager WORK_MANAGER]
#                [--n-workers N_WORKERS]

w_assign -W --bins-from-file --states-from-file -o 

# Kinetics calculation tool
# w_kinetics

# usage: w_kinetics trace [-h] [-W WEST_H5FILE] [--first-iter N_ITER]
#                        [--last-iter N_ITER] [-a ASSIGNMENTS] [-o OUTPUT]
#                        [--no-compression]

w_kinetics -W -a --first-iter --last-iter -o

# Kinetic averaging tool
# w_kinavg 


# usage: w_kinavg trace [-h] [-W WEST_H5FILE] [--first-iter N_ITER]
#                      [--last-iter N_ITER] [--step-iter STEP] [-a ASSIGNMENTS]
#                      [-k KINETICS] [-o OUTPUT] [--alpha ALPHA]
#                      [--autocorrel-alpha ACALPHA] [--nsets NSETS]
#                      [-e {cumulative,blocked,none}]
#                      [--window-frac WINDOW_FRAC]

w_kinavg -W --first-iter --last-iter -k -o 
