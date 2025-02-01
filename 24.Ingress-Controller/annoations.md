The AWS Load Balancer Controller provides a wide range of annotations to help you customize the behavior of your Application Load Balancers (ALBs) when using Kubernetes Ingress resources. In addition to the annotations you mentioned, here are several other commonly used annotations along with a brief explanation of their purpose:

---

### **Security and SSL/TLS**

- **`alb.ingress.kubernetes.io/certificate-arn`**  
  Specifies the ARN of the AWS Certificate Manager (ACM) certificate to use for HTTPS.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/certificate-arn: arn:aws:acm:region:account:certificate/1234abcd-12ab-34cd-56ef-1234567890ab
  ```

- **`alb.ingress.kubernetes.io/ssl-redirect`**  
  Enables automatic redirection from HTTP to HTTPS.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/ssl-redirect: "443"
  ```

- **`alb.ingress.kubernetes.io/ssl-policy`**  
  Sets the SSL policy for the listener (e.g., `ELBSecurityPolicy-2016-08`).  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/ssl-policy: ELBSecurityPolicy-2016-08
  ```

---

### **Backend Communication**

- **`alb.ingress.kubernetes.io/backend-protocol`**  
  Defines the protocol used between the load balancer and your backend service. Valid values are `HTTP` or `HTTPS`.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/backend-protocol: HTTPS
  ```

---

### **Health Checks**

- **`alb.ingress.kubernetes.io/healthcheck-path`**  
  Configures the URL path that the load balancer uses to perform health checks on your targets.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/healthcheck-path: /health
  ```

- **`alb.ingress.kubernetes.io/healthcheck-interval-seconds`**  
  Sets the interval (in seconds) between successive health checks.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/healthcheck-interval-seconds: "30"
  ```

- **`alb.ingress.kubernetes.io/healthcheck-timeout-seconds`**  
  Specifies the timeout (in seconds) for each health check attempt.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/healthcheck-timeout-seconds: "5"
  ```

- **`alb.ingress.kubernetes.io/healthy-threshold-count`**  
  Determines the number of consecutive successful health checks required before considering a target healthy.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/healthy-threshold-count: "3"
  ```

- **`alb.ingress.kubernetes.io/unhealthy-threshold-count`**  
  Determines the number of consecutive failed health checks before considering a target unhealthy.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/unhealthy-threshold-count: "3"
  ```

---

### **Target Group Customization**

- **`alb.ingress.kubernetes.io/target-group-attributes`**  
  Allows you to pass additional attributes to the target group, such as the deregistration delay timeout or slow start duration.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/target-group-attributes: stickiness.enabled=true,stickiness.lb_cookie.duration_seconds=60
  ```

- **`alb.ingress.kubernetes.io/target-group-name`**  
  Specifies a custom name for the target group. This can help with identification in the AWS console.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/target-group-name: my-custom-tg
  ```

---

### **Load Balancer Settings**

- **`alb.ingress.kubernetes.io/load-balancer-name`**  
  Lets you define a custom name for the ALB.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/load-balancer-name: my-custom-alb
  ```

- **`alb.ingress.kubernetes.io/ip-address-type`**  
  Defines the IP address type for the ALB. Valid values are `ipv4` or `dualstack`.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/ip-address-type: dualstack
  ```

- **`alb.ingress.kubernetes.io/connection-idle-timeout`**  
  Configures the idle timeout (in seconds) for connections to the ALB.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/connection-idle-timeout: "60"
  ```

---

### **Advanced Routing and Actions**

- **`alb.ingress.kubernetes.io/actions.<action-name>`**  
  Allows you to define advanced listener rules and actions (such as redirects or fixed responses) on a per-rule basis. Replace `<action-name>` with your custom action identifier.  
  _Example_:  
  ```yaml
  alb.ingress.kubernetes.io/actions.redirect-to-https: >
    {"Type": "redirect", "RedirectConfig": { "Protocol": "HTTPS", "Port": "443", "StatusCode": "HTTP_301"}}
  ```

---

### **Notes**

- **Version & Updates**: The available annotations and their exact behavior can change with different versions of the AWS Load Balancer Controller. Always refer to the [official AWS documentation](https://kubernetes-sigs.github.io/aws-load-balancer-controller/) for the most current information.
  
- **Combining Annotations**: You can combine these annotations to fine-tune the behavior of your ALB to match your application's requirements, whether you need to manage SSL termination, health checking, or routing logic.

Using these annotations effectively allows you to leverage the full power of AWS ALBs while managing them through Kubernetes, giving you a high degree of control over traffic management and load balancing.


The AWS Load Balancer Controller supports two primary schemes for the ALB:

1. **internet-facing**  
   - This scheme exposes the ALB to the public internet.  
   - Use this when you want your application accessible from the internet.

2. **internal**  
   - This scheme creates an ALB that is only accessible within your VPC.  
   - Use this when you want to restrict access to your application to internal resources (such as internal users, services, or VPN connections).

**Example Usage:**

- **Internet-facing ALB:**

  ```yaml
  alb.ingress.kubernetes.io/scheme: internet-facing
  ```

- **Internal ALB:**

  ```yaml
  alb.ingress.kubernetes.io/scheme: internal
  ```

Choose the scheme that best fits your application's access requirements.