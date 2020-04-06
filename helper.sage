import os, sys, glob
from git import Repo

result_path = os.getcwd() + '/jiawei-computational-results/results_datatable/'
extreme_instances_path = os.getcwd() + '/test_instances/extreme_functions/'
minimal_instances_path = os.getcwd() + '/test_instances/minimal_functions/'
non_subadditive_instances_path = os.getcwd() + '/test_instances/non_subadditive_functions/'

repo = Repo(os.getcwd() + '/jiawei-computational-results/')
branch = repo.active_branch

print('This computation task in on the branch {}'.format(branch.name))

# determine the number of algorithms.
total_algorithms = sum(os.path.isdir(result_path+i) for i in os.listdir(result_path))
print('This computation task consists of %s algorithms.'%total_algorithms)

# determine the number of test cases.
if branch.name == "delta_pi_objective_zero" or branch.name == "generate_additive_faces":
    total_instances = len(glob.glob(extreme_instances_path + '*.sobj')) +len(glob.glob(minimal_instances_path + '*.sobj'))
elif branch.name == "delta_pi_minimum" or branch.name == "delta_pi_objective_one_percent":
    total_instances = len(glob.glob(extreme_instances_path + '*.sobj')) + len(glob.glob(minimal_instances_path + '*.sobj')) + len(glob.glob(non_subadditive_instances_path + '*.sobj'))
else:
    raise ValueError('Can not recognize the branch.')
print('There are in total %s test instances.'%total_instances)

# determine the number of jobs.
total_jobs = total_algorithms * total_instances

print('In the slurm manager, specify the parameters total number of jobs = %s'%total_jobs)


