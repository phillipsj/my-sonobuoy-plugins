#! /bin/bash
set -eu
#. osht.sh
eval "$(curl -q -s https://raw.githubusercontent.com/coryb/osht/master/osht.sh)"

PLAN 3

nodes=$(kubectl get nodes -o json | jq -r '.items[] | select(.status.phase = "Ready") | .metadata.name' | wc -l)
echo -e "Nodes: $nodes"
RUNS kubectl apply -f manifest.yaml
RUNS kubectl rollout status daemonsets/mixed-workload
pods=$(kubectl get pod -l "name=mixed-workload" -o json | jq -r '.items[] | select(.status.phase = "Running") | .metadata.name' | wc -l)
echo -r "Pods: $pods"

IS $nodes == $pods