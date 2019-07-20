# Docker-DPDK
The basic idea to build DPDK in docker is sharing host's devices and memory with the container.  
If you want to use multiple dpdk containers with vhost driver, there is an official solution on https://doc.dpdk.org/guides-18.08/howto/virtio_user_for_container_networking.html.  

First, make sure your DPDK examples can run on the host machine.  

UIO driver binding and hugepage memory setting must be finished before building the container.  

In the test environment, there are two NICs bound to the igb_uio driver (container DPDK version:17.08)  
You can use other version DPDK above 17.08  
In DPDK19.05, if you choose to use x86_64-native-linuxapp-gcc compile environment you need to change it to SDK_TARGET=x86_64-native-linux-gcc.  

1)Host setting:  
```bash
git clone https://github.com/XinShuYang/Docker-DPDK.git  
cd Docker-DPDK  
sudo ./host_setup.sh. 
``` 

2)Build your docker image from the Dockerfile:  
```bash
sudo docker build -t docker-dpdk .  
```  

3)Build and run your container from this image:  
```bash
sudo docker run -it --privileged -v /sys/bus/pci/drivers:/sys/bus/pci/drivers -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev  docker-dpdk  bash  
```  

4)Compile the DPDK in the Container:  
```bash
./container_setup.sh  
```  
5)Test examples:  
```bash
./helloworld.sh
```  
or  
```bash
./l2fwd.sh 
```   
In the test environment, I use pktgen to send packages on node0. A DPDK l2fwd example can running in the docker container on node1 and forward packages.  

```
![alt]l2.png
```
