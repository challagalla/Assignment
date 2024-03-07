# Assignemnt on Kubernetes cluster (minikube)


### Prerequisites:
 - [Docker](https://docs.docker.com/engine/install/) 
 - [Minikube](https://minikube.sigs.k8s.io/docs/start/)
 - [kubectl](https://kubernetes.io/docs/tasks/tools/)
 - [IngressController] (https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)
 - [Metricsserver](https://kubernetes-sigs.github.io/metrics-server/)



## Followed below  steps  to  deploy Java app on Minikube :


1. Downloaded the sample Java war from  https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/with and placed it in src folder.
2. Dockerfile is prepared 
```
    FROM tomcat:8.0
    # Remove the default Tomcat applications
    RUN rm -rf /usr/local/tomcat/webapps/*
    # Add your WAR file to Tomcat webapps directory
    COPY ./sample.war /usr/local/tomcat/webapps/ROOT.war
    # Expose port 8080
    EXPOSE 8080
 ```
3. Built Dockerfile  ``` docker build -t imagename:tag . ```
4. Now the kubernetes deployments are created and placed under Manifests folder
```
      webapp-deployment.yaml
      webapp-service.yaml
      webapp-ingress.yaml
      webapp-hpa.yaml
```
5. Deploy both deployment and service using below commands 
```
    kubectl apply -f webapp-deployment.yaml
    kubectl apply -f webapp-service.yaml
 ```
6. For Ingress, deployed a ngnix ingress controller on the minkube  ``` minikube addons enable ingress ```
7. Now Deployed ingress using ``` kubectl apply -f webapp-ingress.yaml``` 
8. To Access the webapp  : ``` curl --resolve "assigment-webapp.local:80:$( minikube ip )" -i http://assigment-webapp.local ```
10. To make the app stable and available during high load we will implement Horizontal pod autoscaller.
11. For HPA to work effecienlty we will deploy Metric server in the cluster.
12. Once metric server is deployed we can deploy HPA using ``` kubectl apply -f webapp-hpa.yaml```
13. Now the HPA will automatically scale the pods based on the limits we mentioned in the HPA  declaration. Example here
```
   minReplicas: 2
   maxReplicas: 5
   targetCPUUtilizationPercentage: 60
```
14. Health Checks: Implement health checks in application to detect and handle failures gracefully. Kubernetes liveness and readiness probes can be used for this purpose.  
15. Monitoring and Alerting: Set up monitoring and alerting systems to detect abnormal behavior and respond promptly to issues. Use tools like Prometheus and Grafana for monitoring Kubernetes clusters and applications.
16. Security Considerations: Implement security best practices such as TLS termination, rate limiting, and WAF (Web Application Firewall) depending on your application requirements.
17. Scaling: Configure Horizontal Pod Autoscaler and Vertical Pod Autoscaler to scale your application based on demand. HPA is already implemented here.
18. Logging: Implement centralized logging using tools like Elasticsearch, Fluentd, and Kibana (EFK) stack.

 

    
