import os, sys, glob
import cpuinfo
import pandas as pd

# store cpuinfo
data = pd.DataFrame.from_dict({ key: str(value) for key, value in
cpuinfo.get_cpu_info().iteritems()}, orient='index')
data.to_csv("./system_info/cpuinfo.csv", index=True, header=False)

# print experiment info
result_path = os.getcwd() + '/jiawei-computational-results/results_datatable/'
extreme_instances_path = os.getcwd() + '/test_instances/extreme_functions/'
minimal_instances_path = os.getcwd() + '/test_instances/minimal_functions/'
non_subadditive_instances_path = os.getcwd() + '/test_instances/non_subadditive_functions/'

print('This expriment is about computing the minimum of the subadditivity slack of a cut generating function.')

# determine the number of algorithms.
all_algorithms_path = [result_path+i for i in os.listdir(result_path) if os.path.isdir(result_path+i)]
total_algorithms = len(all_algorithms_path)
print('This computation task consists of %s algorithms.'%total_algorithms)

# determine the number of test cases.
all_instances = sorted(glob.glob(extreme_instances_path + '*.sobj') + glob.glob(minimal_instances_path + '*.sobj') + glob.glob(non_subadditive_instances_path + '*.sobj'))
total_instances = len(all_instances)
print('There are in total %s test instances.'%total_instances)

# determine the number of jobs.
total_jobs = total_algorithms * total_instances

print('In the slurm manager, specify the parameters total number of jobs = {}, using --array=1-{}'.format(total_jobs,total_jobs))


