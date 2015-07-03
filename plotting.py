import numpy as np

def avg_1d(hist, midpoints, binbounds):
  
    # First we are going to import the pyplot library
    # to get access to the matplotlib object so we can 
    # further modify it.
    import matplotlib.pyplot as plt

    # Now we are going to change the title, add axis labels
    plt.title('TEST TITLE')
    plt.xlabel('X AXIS')
    plt.ylabel('Free energy surface (kT)')

def evo_1d(hist, midpoints, binbounds):
    import matplotlib.pyplot as plt
    plt.title('TEST TITLE')
    plt.xlabel('X AXIS')
    plt.ylabel('WE Iteration')

def avg_2d(hist, midpoints, binbounds):
    import matplotlib.pyplot as plt
    plt.title('TEST TITLE')
    plt.xlabel('X AXIS')
    plt.ylabel('Y AXIS')

def avg_aux_2d(hist, midpoints, binbounds):
    import matplotlib.pyplot as plt
    plt.title('TEST TITLE')
    plt.xlabel('X AXIS')
    plt.ylabel('Y AXIS')
