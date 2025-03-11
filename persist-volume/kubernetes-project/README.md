# Kubernetes Project Documentation

This project contains Kubernetes manifests for deploying a web server using NGINX with persistent storage. The resources defined include a PersistentVolume, a PersistentVolumeClaim, a Pod, and a NodePort Service.

## Project Structure

```
kubernetes-project
├── manifests
│   ├── persistent-volume.yaml
│   ├── persistent-volume-claim.yaml
│   ├── pod.yaml
│   └── service.yaml
└── README.md
```

## Resources

1. **PersistentVolume** (`persistent-volume.yaml`):
   - Name: `pv-xfusion`
   - Storage Class: `manual`
   - Capacity: `4Gi`
   - Access Mode: `ReadWriteOnce`
   - Host Path: `/mnt/itadmin`

2. **PersistentVolumeClaim** (`persistent-volume-claim.yaml`):
   - Name: `pvc-xfusion`
   - Storage Class: `manual`
   - Requested Storage: `3Gi`
   - Access Mode: `ReadWriteOnce`

3. **Pod** (`pod.yaml`):
   - Name: `pod-xfusion`
   - Container Name: `container-xfusion`
   - Image: `nginx:latest`
   - Mounts the PersistentVolumeClaim `pvc-xfusion` at the document root.

4. **Service** (`service.yaml`):
   - Name: `web-xfusion`
   - Type: `NodePort`
   - Exposes the web server on Node Port: `30008`

## Deployment Instructions

To deploy the resources defined in the manifests, follow these steps:

1. Ensure you have access to a Kubernetes cluster.
2. Apply the manifests in the following order:
   ```bash
   kubectl apply -f manifests/persistent-volume.yaml
   kubectl apply -f manifests/persistent-volume-claim.yaml
   kubectl apply -f manifests/pod.yaml
   kubectl apply -f manifests/service.yaml
   ```
3. Verify the deployment:
   ```bash
   kubectl get pv
   kubectl get pvc
   kubectl get pods
   kubectl get services
   ```

4. Access the web server using the Node IP and port `30008`.