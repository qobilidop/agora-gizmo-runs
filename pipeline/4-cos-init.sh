#!/usr/bin/env bash
set -e

export SIM_IC=1e12q.dat
export SIM_JOB_OMP=2
export SIM_JOB_NODES=8
export SIM_JOB_TEMPLATE="$PROJECT_ROOT/pipeline/job/edison-sim-template.sh"

for sim_config in "$PROJECT_ROOT"/data/sim/cos-*.sh; do
    SIM_NAME="$(basename "$sim_config" .sh)"
    export SIM_NAME
    echo "Initializing $SIM_NAME"
    source "$sim_config"
    init-sim.sh
    # Extra preparations for cosmological runs
    cd "$PROJECT_ROOT/data/sim/$SIM_NAME"
    cp "$PROJECT_ROOT/data/ic/1e12q.conf" ic.conf
    cp "$PROJECT_ROOT/data/ot/a.txt" output-times.txt
done