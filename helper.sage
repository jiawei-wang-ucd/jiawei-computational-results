import os, sys

result_path = os.getcwd() + '/jiawei-computational-results/results_datatable/'
test_instances_path = os.getcwd() + '/test_instancs/'

# determine the number of algorithms.
total_algorithms = sum(os.path.isdir(result_path+i) for i in os.listdir(result_path))
print('This computation task consists of %s algorithms.'%total_algorithms)

# determine the number of test cases.

print('There are in total %s test instances.'%total_instances)

print('In the slurm ')


