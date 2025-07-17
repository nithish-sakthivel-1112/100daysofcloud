# Kubernetes 

## History and Evaloution of Application Deployments

### Classic Setup
In the Intital days the companies need to order a physical server and once the server has been arrived they need to setup networking, OS and everything on their own. This classic setup follows the *One Application for One server* approach 

This approach is well suited for the monolith applications, but when it comes to the microservices setup you may need to setup n numbers of servers according to your application

Another cons of classic setup is lots and lots of resource has been wasted For eg: You bought a physical server with 4GB RAM and 500Gb of storage, but your application is using less than 50% of the resources. 

### Virtualization

To overcome the resource wastage the companies started to virtualize their physical servers. To know more about the Virtual Machines check out my blog here : [Virtual Machine](https://nithish0829.hashnode.dev/the-what-why-and-how-of-virtual-machines)

Virtualization is nothing but slicing your hardware resource into chuncks deploy multiple applications.

### Containers

But the problem with the Virtual machines is each vitrual machine needs it's own host OS, so we need to allocate the sufficient amount of hardware resource to virtual machines so that it can run efficiently. To overcome this containers has been introduced 

A container is a lightweight, standalone, and executable software package that includes everything needed to run an application: code, runtime, system tools, system libraries, and settings. Containers ensure that applications run consistently across different environments by isolating the software from its environment