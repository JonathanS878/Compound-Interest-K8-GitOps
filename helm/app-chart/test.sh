#!/bin/bash


# Get the pod names for the web page and database pods
web_page_pod=$(kubectl get pods -l app=cp -o jsonpath='{.items[0].metadata.name}') >/dev/null 2>&1
database_pod_ip=$(kubectl get pods -l app=mongo -o jsonpath='{.items[0].status.podIP}') >/dev/null 2>&1

# Check if there is connectivity to the web page
if curl -s http://$(minikube ip):30100 >/dev/null 2>&1; then
  echo "There is connectivity to the web page."
else
  echo "There is no connectivity to the web page."
fi

# Check if the web page pod has connectivity to the database pod
if kubectl exec -it $web_page_pod -- ping -c 1 $database_pod_ip >/dev/null 2>&1; then
  echo "The web page pod has connectivity to the database pod."
else
  echo "The web page pod does not have connectivity to the database pod."
fi
