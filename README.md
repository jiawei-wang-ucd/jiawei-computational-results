# jiawei-computational-results
Repository holding computational results, to be included as a submodule in repository jiawei-computations. This repository also contains a submodule cutgeneratingfunctionology, which constains codes of cut generating function research. 

- Different branches of the repository represent different computational tasks. 
- The file `prerun.sage` prints information of the computational task, and the file will be run before submitting jobs to the HPC. The file is invariant across branches.
- The file `helper.sage` specifies the parameters of the computational task.
- The folder `results_datatable` holds raw data of running times and cpu memory usage. Every directory inside `results_datatable` stores raw data of one algorithm applied to the computational task, which is specified by the branch name.
