#!/bin/sh
# nodepool 상태 확인
echo "===================================================================================="
echo "==================================== CHECK ===================================="
echo "===================================================================================="
echo "===== all node ====="
kubectl get node -L kakaoi.io/kke-nodepool
echo "===== none-role node ====="
kubectl get node -L kakaoi.io/kke-nodepool |grep "<none>"
echo "===================================================================================="
echo "==================================== pre-excute ===================================="
echo "===================================================================================="
echo "===== labelling target ====="
kubectl get node -L kakaoi.io/kke-nodepool |grep "<none>" |awk '{print $1,$6}' |awk -F "-nodepool" '{print $1}'
echo "===== labelling command ====="
kubectl get node -L kakaoi.io/kke-nodepool |grep "<none>" |awk '{print $1,$6}' |awk -F "-nodepool" '{print $1}' |awk '{print "kubectl label node "$1 " node-role.kubernetes.io/"$2"=\"\""}'
echo "===================================================================================="
echo "==================================== EXCUTE ===================================="
echo "===================================================================================="
echo
echo "*** Press Enter to labelling node-role ***"
read
# node-role label 설정
kubectl get node -L kakaoi.io/kke-nodepool |grep "<none>" |awk '{print $1,$6}' |awk -F "-nodepool" '{print $1}' |awk '{print "kubectl label node "$1 " node-role.kubernetes.io/"$2"=\"\""}' |bash
echo "===================================================================================="
echo "==================================== CHECK ===================================="
echo "===================================================================================="
echo "===== all node ====="
kubectl get node -L kakaoi.io/kke-nodepool
echo "===== none-role node ====="
kubectl get node -L kakaoi.io/kke-nodepool |grep "<none>"
echo "===== discribe node-role ====="
kubectl describe node |egrep "Roles|node-role.kubernetes.io"