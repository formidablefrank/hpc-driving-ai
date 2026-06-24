#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=32
#SBATCH --time=00:30:00
#SBATCH --mem=8G
##SBATCH --exclusive
#SBATCH --hint=multithread
#SBATCH --mem-bind=local
#SBATCH --distribution=block:block
#SBATCH --account=ICT26_MHPC_0
#SBATCH --partition=boost_usr_prod
#SBATCH --qos=boost_qos_dbg
#SBATCH --output=logs/slurm-%j.out
#SBATCH --error=logs/slurm-%j.err

source /leonardo_scratch/large/userexternal/jrayo000/hpc-driving-ai/openxla-porting/.venv/bin/activate

# Resolve paths from the script location (robust to where `sbatch` is run).
exercises_dir=/leonardo_scratch/large/userexternal/jrayo000/hpc-driving-ai/openxla-porting
# cd "${exercises_dir}"

# Make local exercise modules importable from Jupyter kernels.
export PYTHONPATH="${script_dir}:${exercises_dir}:${PYTHONPATH}"

export NUMBA_NUM_THREADS=${SLURM_CPUS_PER_TASK}
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}
echo "ID: ${SLURM_JOB_ID} Nodes: ${SLURM_NNODES}, tasks: ${SLURM_NTASKS}, ranks/node: ${SLURM_NTASKS_PER_NODE}, threads/rank: ${SLURM_CPUS_PER_TASK}, numba_threads: ${NUMBA_NUM_THREADS}"

# get tunneling info
XDG_RUNTIME_DIR=""
node=$(hostname -s)
user=$(whoami)
portval=18891

# print tunneling instructions jupyter-log
echo -e "
# One-command tunnel from your LOCAL machine:
ssh -N -L ${portval}:127.0.0.1:${portval} \
  -o ServerAliveInterval=30 -o ServerAliveCountMax=6 \
  -J ${user}@login.leonardo.cineca.it ${user}@${node}.leonardo.local

# Use a browser on your local machine to go to:
http://localhost:$portval/
"

# Launch exactly one Jupyter server (no multi-task port conflicts).
# srun --ntasks=1 --nodes=1
srun --cpu-bind=cores \
  jupyter lab --ip=0.0.0.0 --port=${portval} --no-browser --allow-root \
  --ServerApp.root_dir="${exercises_dir}" \
  --ServerApp.shutdown_no_activity_timeout=0 \
  --MappingKernelManager.cull_idle_timeout=0 \
  --MappingKernelManager.cull_connected=False \
  --IdentityProvider.token='' --PasswordIdentityProvider.hashed_password=''
