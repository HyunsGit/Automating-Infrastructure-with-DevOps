#!/bin/sh
# rainbow flavor
W="\033[47;30m"
Y="\033[43;31m"
R="\033[43;31m"
G="\033[0;32m"
E="\033[0m"
B="\033[0;34m"


echo "===================================================================================="
echo "$R NODE TAINT STATUS $E"
echo "\n"
echo "$G ===== tainted node ===== $E"
#get hostname / toleration
kubectl get nodes -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.taints[*].key}{"="}{.spec.taints[*].value}{":"}{.spec.taints[*].effect}{"\t"}{.metadata.labels.kakaoi\.io/kke-nodepool}{"\n"}{end}' | grep -v '=:'
echo "$G ===== untainted node ===== $E"
#get untainted nodes
kubectl get nodes -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.taints[*].key}{"="}{.spec.taints[*].value}{":"}{.spec.taints[*].effect}{"\t"}{.metadata.labels.kakaoi\.io/kke-nodepool}{"\n"}{end}'  | grep '=:'
echo "\n"
echo "===================================================================================="


echo "$Y ***** Following Command will be executed ***** $E"
echo "\n"
echo "$G ===== applying taint ===== $E"
kubectl get node -o custom-columns=\
NAME:.metadata.name,\
"LABEL(node-type)":.metadata.labels.node-type,\
'TAINT(key):.spec.taints[*].key',\
'TAINT(value):.spec.taints[*].value',\
'EFFECT:.spec.taints[*].effect'\
|grep "<none>" | grep -v "service" | awk '{print "kubectl taint node "$1 " node-type="$2":NoSchedule"}'
echo "\n"
echo "===================================================================================="


echo
echo "$G *** Press Enter to labelling node-role *** $E"
read


echo "===================================================================================="
echo "\n"
# taint untainted nodes
kubectl get node -o custom-columns=\
NAME:.metadata.name,\
"LABEL(node-type)":.metadata.labels.node-type,\
'TAINT(key):.spec.taints[*].key',\
'TAINT(value):.spec.taints[*].value',\
'EFFECT:.spec.taints[*].effect'\
|grep "<none>" | grep -v "service" | awk '{print "kubectl taint node "$1 " node-type="$2":NoSchedule"}' | bash


echo "===================================================================================="
echo "$Y CHECK $E"
echo "\n"
#get untainted nodes
echo "$G ===== untainted node ===== $E"
kubectl get nodes -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.taints[*].key}{"="}{.spec.taints[*].value}{":"}{.spec.taints[*].effect}{"\t"}{.metadata.labels.kakaoi\.io/kke-nodepool}{"\n"}{end}'  | grep '=:'
echo "$G ===== verify tainted node ===== $E" 
#get hostname / toleration
kubectl get nodes -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.taints[*].key}{"="}{.spec.taints[*].value}{":"}{.spec.taints[*].effect}{"\t"}{.metadata.labels.kakaoi\.io/kke-nodepool}{"\n"}{end}' | grep -v 'service-nodepool'
echo "\n"
echo "===================================================================================="
echo "$B DONE $E"