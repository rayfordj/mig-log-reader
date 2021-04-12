#!/bin/bash
CONFIGPATH=/var/cache/sa2kubeconfig/kubeconfig-${KSUFFIX}

stern -l app.kubernetes.io/part-of=openshift-migration \
--color ${STERN_COLOR} \
--exclude-container discovery \
--exclude "watch is too old"  \
--exclude "Found new dockercfg secret" \
--exclude "backup location named \\\"default\\\" was not found" \
--exclude "needs to be at least 1 backup location" \
--exclude "No backup locations were ready to be verified" \
--exclude "Backup cannot be garbage-collected" \
--exclude "Error checking repository for stale locks" \
--since 5s \
--all-namespaces \
--kubeconfig ${CONFIGPATH} \
