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
all_algorithms_path = [result_path+i for i in os.listdir(result_path) if os.path.isdir(result_path+i)]
total_algorithms = len(all_algorithms_path)
print('This computation task consists of %s algorithms.'%total_algorithms)

# determine the number of test cases.
if branch.name == "delta_pi_objective_zero" or branch.name == "generate_additive_faces":
    all_instances = sorted(glob.glob(extreme_instances_path + '*.sobj') + glob.glob(minimal_instances_path + '*.sobj'))
elif branch.name == "delta_pi_minimum" or branch.name == "delta_pi_objective_one_percent":
    all_instances = sorted(glob.glob(extreme_instances_path + '*.sobj') + glob.glob(minimal_instances_path + '*.sobj') + glob.glob(non_subadditive_instances_path + '*.sobj'))
else:
    raise ValueError('Can not recognize the branch.')

total_instances = len(all_instances)
print('There are in total %s test instances.'%total_instances)

# determine the number of jobs.
total_jobs = total_algorithms * total_instances

def from_taskid_to_instance_and_algorithm(taskid, total_algorithms, total_instances, all_instances, all_algorithms_path):
    """
    Return the instance file and result path of the corresponding algorithm, given the task id in sbatch.
    """
    assert taskid>=1 and task_id<=total_algorithms * total_instances
    instance_index = taskid % total_instances
    algorithm_index = (taskid-1)//total_instances
    input_file_name = all_instances[instance_index]
    output_file_path = all_algorithms_path[algorithm_index]
    return input_file_name, output_file_path

print('In the slurm manager, specify the parameters total number of jobs = {}, using --array=1-{}'.format(total_jobs,total_jobs))


