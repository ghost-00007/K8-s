# Kubernetes Control/Master Node Components

The Control (or Master) Node in Kubernetes manages the cluster and ensures the desired state of the system. Below are the key components and their roles:

## 1. **kube-apiserver**
- Acts as the frontend of the Kubernetes control plane.
- Provides a RESTful API to interact with the cluster.
- Validates and processes requests, communicating with other components to enforce the desired state.

## 2. **etcd**
- A distributed key-value store for all cluster data.
- Stores configuration data, secrets, and service discovery information.
- Ensures high availability and consistency across the cluster.

## 3. **kube-controller-manager** (or **cloud-controller-manager**)
- Runs controllers that handle lifecycle functions in the cluster:
  - **Node controller**: Detects and responds to node failures.
  - **Replication controller**: Maintains the desired number of pods.
  - **Cloud-specific controllers**: Integrates with cloud providers.
- Ensures the cluster is in the desired state by monitoring and reacting to changes.

## 4. **kube-scheduler**
- Assigns newly created pods to available nodes.
- Considers resource requirements, policy constraints, and topology when scheduling pods.

## 5. **kubelet**
- Agent that runs on each node (including the master node in some setups).
- Ensures containers are running in a pod.
- Communicates with the container runtime to manage container lifecycle.

## 6. **kube-proxy**
- Manages network rules for connecting pods to each other and external services.
- Ensures efficient communication within the cluster using methods like IP tables or IP Virtual Server (IPVS).

## 7. **CRI (Container Runtime Interface)**
- Interface between Kubernetes and the container runtime.
- Examples of supported container runtimes:
  - **Docker**
  - **containerd**
  - **CRI-O**
  - Others compatible with the CRI standard.
