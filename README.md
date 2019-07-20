# Docker-DPDK

First, make sure your DPDK examples can run on the host machine.

UIO driver binding and hugepage memory setting must be finished before building the container.

1)Host setting:  
git clone https://github.com/XinShuYang/Docker-DPDK.git  
cd Docker-DPDK  
sudo ./host_setup.sh. 

2)Build your docker image from the Dockerfile:  
sudo docker build -t docker-dpdk .  

3)Build and run your container from this image:  
sudo docker run -it --privileged -v /sys/bus/pci/drivers:/sys/bus/pci/drivers -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev  docker-dpdk  bash  

4)Compile the DPDK in the Container:  
./container_setup.sh  

5)Test examples:  
./helloworld.sh  
or  
./l2fwd.sh. 
