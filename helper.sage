import os, sys
from git import Repo

result_path = os.getcwd() + '/jiawei-computational-results/results_datatable/'
test_instances_path = os.getcwd() + '/test_instancs/'

repo = Repo(os.getcwd() + '/jiawei-computational-results/')
branch = repo.active_branch

print('This computation task in on the branch {}'.format(branch.name))

# determine the number of algorithms.
total_algorithms = sum(os.path.isdir(result_path+i) for i in os.listdir(result_path))
print('This computation task consists of %s algorithms.'%total_algorithms)

# determine the number of test cases.
total_instances = 0
print('There are in total %s test instances.'%total_instances)

# determine the number of jobs.

total_jobs = total_algorithms * total_instances

print('In the slurm manager, specify the parameters total number of jobs = %s'%total_jobs)


