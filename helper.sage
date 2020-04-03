import os

result_path = './results_datatable/'
test_cases_path = './test_cases_datatable/'

# determine the number of algorithms.
total_algorithms = sum(os.path.isdir(result_path+i) for i in os.listdir(result_path))

# determine the number of test cases.


