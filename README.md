# jiawei-computational-results
Repository holding computational results, to be included as a submodule in repository [jiawei-computations](https://github.com/mkoeppe/jiawei-computations). 

## Structure

- Different branches of the repository represent different computational tasks. 
- The file `prerun.sage` prints information of the computational task, and the file will be run before submitting jobs to the HPC. The file is invariant across branches.
- The file `helper.sage` is branch-specific, and it determines the computational task. The file will be run in every job submitted to the HPC.
- This repository contains a submodule [cutgeneratingfunctionology](https://github.com/mkoeppe/cutgeneratingfunctionology), which constains the source code and algorithms on cut generating functions. 
- The file `git_branch_commit_info` stores the branch and commit infomation of the three repositories [jiawei-computations](https://github.com/mkoeppe/jiawei-computations), [jiawei-computational-results](https://github.com/mkoeppe/jiawei-computational-results) and [cutgeneratingfunctionology](https://github.com/mkoeppe/cutgeneratingfunctionology). The file refers the computational results to the version of code.
- The folder `results_datatable` holds raw data of running times and cpu memory usage. Every directory inside `results_datatable` stores raw data of one algorithm applied to the computational task, which is specified by the branch name.
