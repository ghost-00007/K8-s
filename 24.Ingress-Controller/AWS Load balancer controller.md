### AWS Load Balancer Controller

The **AWS Load Balancer Controller** is a Kubernetes controller designed to manage **Application Load Balancers (ALBs)** and **Network Load Balancers (NLBs)** for workloads running on **Amazon Elastic Kubernetes Service (EKS)**. This controller replaces the older **ALB Ingress Controller** and enhances the functionality of managing AWS load balancers directly from Kubernetes.

The controller dynamically provisions and configures AWS load balancers based on Kubernetes **Ingress** and **Service** resources, simplifying the process of exposing Kubernetes applications to both internet and internal networks.

---

### Key Features of AWS Load Balancer Controller

1. **Supports Multiple AWS Load Balancer Types**:
   - **Application Load Balancer (ALB)**: For Layer 7 (HTTP/HTTPS) traffic.
   - **Network Load Balancer (NLB)**: For Layer 4 (TCP/UDP) traffic.

2. **Dynamic Load Balancer Provisioning**:
   - Automatically creates and configures ALBs or NLBs based on Kubernetes Ingress or Service definitions.

3. **Integration with Kubernetes Ingress**:
   - Uses Kubernetes **Ingress** resources to define routing rules for ALBs.
   - Supports advanced routing features like host-based and path-based routing.

4. **Integration with Kubernetes Services**:
   - Supports **LoadBalancer** type Services for exposing applications using NLBs or ALBs.

5. **SSL/TLS Termination**:
   - Handles SSL/TLS termination at the load balancer level.

6. **Target Group Management**:
   - Automatically registers Kubernetes pods as targets for the load balancer.

7. **Cross-Zone Load Balancing**:
   - Distributes traffic evenly across all targets in all Availability Zones.

8. **Integration with AWS WAF**:
   - Supports AWS Web Application Firewall (WAF) for protecting web applications.

---

### Types of Load Balancing Supported

The AWS Load Balancer Controller supports two types of AWS load balancers:

1. **Application Load Balancer (ALB)**:
   - **Layer**: Operates at **Layer 7 (application layer)**.
   - **Protocols**: HTTP, HTTPS, WebSockets.
   - **Use Case**: Best for web applications, microservices, and HTTP/HTTPS traffic.
   - **Features**:
     - Path-based routing.
     - Host-based routing.
     - SSL/TLS termination.
     - Integration with AWS WAF.

2. **Network Load Balancer (NLB)**:
   - **Layer**: Operates at **Layer 4 (transport layer)**.
   - **Protocols**: TCP, UDP, TLS.
   - **Use Case**: Best for high-performance, low-latency applications (e.g., gaming, real-time streaming).
   - **Features**:
     - Extremely low latency.
     - Static IP addresses.
     - Support for preserving the source IP address.

---

### Routing Methods Supported

The AWS Load Balancer Controller supports different routing methods depending on the type of load balancer and the Kubernetes resource used (Ingress or Service).

#### For Application Load Balancer (ALB):
- **Host-Based Routing**:
  - Routes traffic based on the hostname in the HTTP request (e.g., `example.com`).
  - Example: Route `app1.example.com` to Service A and `app2.example.com` to Service B.
  
- **Path-Based Routing**:
  - Routes traffic based on the URL path in the HTTP request (e.g., `/api`, `/static`).
  - Example: Route `/api` to Service A and `/static` to Service B.

- **SSL/TLS Termination**:
  - Terminates SSL/TLS at the ALB and forwards unencrypted traffic to backend pods.

- **Weighted Routing**:
  - Distributes traffic between multiple services based on weights (e.g., 80% to Service A, 20% to Service B).

#### For Network Load Balancer (NLB):
- **TCP/UDP Routing**:
  - Routes traffic based on the TCP/UDP port.
  - Example: Route traffic on port 80 to Service A and port 443 to Service B.

- **Source IP Preservation**:
  - Preserves the source IP address of the client for backend applications.

---

### How It Works

1. **Ingress Resource**:
   When you define an Ingress resource in Kubernetes, the AWS Load Balancer Controller provisions an ALB and configures it based on the rules specified in the Ingress.
   
   Example:
   ```yaml
   apiVersion: networking.k8s.io/v1
   kind: Ingress
   metadata:
     name: example-ingress
     annotations:
       kubernetes.io/ingress.class: alb
   spec:
     rules:
       - host: app1.example.com
         http:
           paths:
             - path: /api
               pathType: Prefix
               backend:
                 service:
                   name: service-a
                   port:
                     number: 80
       - host: app2.example.com
         http:
           paths:
             - path: /
               pathType: Prefix
               backend:
                 service:
                   name: service-b
                   port:
                     number: 80
   ```

2. **Service Resource (LoadBalancer Type)**:
   When you define a Service of type `LoadBalancer`, the AWS Load Balancer Controller provisions an NLB or ALB depending on annotations and configures it to route traffic to the service.
   
   Example:
   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: example-service
     annotations:
       service.beta.kubernetes.io/aws-load-balancer-type: nlb
   spec:
     type: LoadBalancer
     ports:
       - port: 80
         targetPort: 8080
     selector:
       app: example-app
   ```

---

### Annotations for Customization

The AWS Load Balancer Controller uses annotations to customize load balancer behavior. Common annotations include:

- For ALB:
  - `kubernetes.io/ingress.class: alb`: Specifies that the Ingress should be managed by the AWS Load Balancer Controller.
  - `alb.ingress.kubernetes.io/scheme`: Specifies whether the ALB is internet-facing (`internet-facing`) or internal (`internal`).
  - `alb.ingress.kubernetes.io/certificate-arn`: Specifies the ARN of the SSL/TLS certificate for HTTPS.

- For NLB:
  - `service.beta.kubernetes.io/aws-load-balancer-type: nlb`: Specifies that the Service should use an NLB.
  - `service.beta.kubernetes.io/aws-load-balancer-nlb-target-type`: Specifies the target type (`instance` or `ip`).

---

### When to Use AWS Load Balancer Controller

- Use **ALB** if you need Layer 7 routing (HTTP/HTTPS) with advanced features like path-based or host-based routing and SSL/TLS termination.

- Use **NLB** if you require Layer 4 routing (TCP/UDP) with high performance, low latency, and source IP address preservation.

---

### Summary

The AWS Load Balancer Controller is a robust tool for managing AWS load balancers (ALB and NLB) in EKS clusters. It supports:

- ALB for Layer 7 routing with host-based and path-based capabilities.
- NLB for Layer 4 routing focusing on high performance and low latency.

Choose the appropriate load balancer type and routing method based on your application's requirements.

Citations:
[1] https://docs.aws.amazon.com/eks/latest/best-practices/load-balancing.html
[2] https://aws.amazon.com/blogs/networking-and-content-delivery/deploying-aws-load-balancer-controller-on-amazon-eks/
[3] https://www.youtube.com/watch?v=5XpPiORNy1o
[4] https://www.eksworkshop.com/docs/fundamentals/exposing/aws-lb-controller
[5] https://docs.aws.amazon.com/zh_en/eks/latest/userguide/aws-load-balancer-controller.html
[6] https://kubernetes-sigs.github.io/aws-load-balancer-controller/
[7] https://github.com/kubernetes-sigs/aws-load-balancer-controller/actions
[8] https://docs.aws.amazon.com/eks/latest/userguide/network-load-balancing.html

---
