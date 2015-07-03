import numpy as np

def pull_data(n_iter, iter_group):
    import h5py 
    rmsd_file = h5py.File('/home/boltzmann/PROJECTS/VILLIN/analyze_RMSD/RMSD_OF_HFBIC_RES/RMSDS_800_1000.h5')
    rmsd_data = rmsd_file['iterations/iter_%08d/rmsd_all_hphc'%(n_iter)][...]
    
    data = np.dstack( (iter_group['auxdata/mdist_1'][...], rmsd_data) )

    return data
