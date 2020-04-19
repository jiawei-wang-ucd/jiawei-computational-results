import os, sys, glob

result_path = os.getcwd() + '/jiawei-computational-results/results_datatable/'
extreme_instances_path = os.getcwd() + '/test_instances/extreme_functions/'
minimal_instances_path = os.getcwd() + '/test_instances/minimal_functions/'
non_subadditive_instances_path = os.getcwd() + '/test_instances/non_subadditive_functions/'

# determine the number of algorithms.
all_algorithms_path = [result_path+i for i in os.listdir(result_path) if os.path.isdir(result_path+i)]
total_algorithms = len(all_algorithms_path)

# determine the number of test cases.
all_instances = sorted(glob.glob(extreme_instances_path + '*.sobj') + glob.glob(minimal_instances_path + '*.sobj') + glob.glob(non_subadditive_instances_path + '*.sobj'))
total_instances = len(all_instances)

# determine the number of jobs.
total_jobs = total_algorithms * total_instances

def from_taskid_to_instance_and_algorithm(taskid, total_algorithms, total_instances, all_algorithms_path, all_instances):
    """
    Return the instance file and result path of the corresponding algorithm, given the task id in sbatch.
    """
    assert taskid>=1 and task_id<=total_algorithms * total_instances
    instance_index = taskid % total_instances
    algorithm_index = (taskid-1)//total_instances
    input_file_name = all_instances[instance_index]
    output_file_path = all_algorithms_path[algorithm_index]
    return input_file_name, output_file_path

function = is_objective_goal_reached_one_percent
