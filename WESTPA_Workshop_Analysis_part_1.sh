# Created by: Ali Sinan Saglam
# For 2015 WESTPA Workshop, analysis tools 

### Variables ### 
# Set all your variables here if you didn't go with 
# the default settings 

#H5FILE='west.h5'
H5FILE=/home/boltzmann/PROJECTS/VILLIN/analyze_RMSD/RMSD_OF_HFBIC_RES/west.h5
WESTBIN=/home/boltzmann/apps/westpa/bin

# Note:
# For every tool I suggest using -h option if you get stuck or want to learn
# more, most of the tools are well documented! 

### Part 1: Free Energy Landscape ### 


# Histogramming tool 

# w_pdist is the tool used in order to generate histograms 
# for different datasets (including but not limited to the progress coordinate). 

# usage: w_pdist [-h] [-r RCFILE] [--quiet | --verbose | --debug] [--version]
#                [--max-queue-length MAX_QUEUE_LENGTH] [-W WEST_H5FILE]
#                [--first-iter N_ITER] [--last-iter N_ITER] [-b BINEXPR]
#                [-o OUTPUT] [-C] [--loose]
#                [--construct-dataset CONSTRUCT_DATASET | --dsspecs DSSPEC [DSSPEC ...]]
#                [--serial | --parallel | --work-manager WORK_MANAGER]
#                [--n-workers N_WORKERS]

# By default the tool will histogram the progress coordinate with the bins 
# as defined in the system.py (or west.cfg) files. 
$WESTBIN/w_pdist -W $H5FILE -o pdist.h5

# Plotting the histograms
# 1D plotting and basic plotting controls

# usage: plothist average [-h] [-o PLOT_OUTPUT] [--hdf5-output HDF5_OUTPUT]
#                         [--plot-contour] [--title TITLE]
#                         [--linear | --energy | --zero-energy E | --log10]
#                         [--range RANGE]
#                         [--postprocess-function POSTPROCESS_FUNCTION]
#                         [--text-output TEXT_OUTPUT] [--first-iter N_ITER]
#                         [--last-iter N_ITER]
#                         input [DIMENSION] [ADDTLDIM]

# 1D average
# The following command will produce a png that plots the free energy landscape of the 
# first dimension of the progress coordinate and sets the y-axis limit to 10kT. 
$WESTBIN/plothist average -o 1d_average.png --range 0,10 --postprocess-function plotting.avg_1d pdist.h5 0

# 1D evolution
# The following command will produce a png that plots the free energy landscape of the 
# first dimension of the progress coordinate as a function of WE iteration and sets the color bar to 10kT.
$WESTBIN/plothist evolution -o 1d_evolution.png --range 0,10 --postprocess-function plotting.evo_1d pdist.h5 0

# 2D plotting and pulling in auxiliary data collected 

# Since we have the progress coordinate already histogrammed we can plot the two dimensions 
# of the progress coordinate. This next command wiill produce a color map of the free energy
# as a function of the two progress coordinates. 
$WESTBIN/plothist average -o 2d_average.png --range 0,10 --postprocess-function plotting.avg_2d pdist.h5 0 1 

# A very useful thing to know about the w_pdist command is the option to pull in auxiliary datasets 
# and being able to histogram those. This way you can keep track of auxiliary data during your simulation
# This is done by defining a python function and supplying the function to the option --construct-dataset
# We will also change the binning as defined in the system.py and instead bin the auxiliary dataset 

# First we need to histogram the auxiliary data
$WESTBIN/w_pdist -W $H5FILE -o aux_pdist.h5 --construct-dataset assignment.pull_data  -b 200 --first-iter 800

# Now we can plot the free energy landscape as a function of the first dimension of the progress coordinate 
# and the auxiliary dataset.
$WESTBIN/plothist average -o 2d_aux_average.png --first-iter 800 --range 0,10 --postprocess-function plotting.avg_aux_2d aux_pdist.h5 0 1
