export RTE_SDK=/root/dpdk-stable-17.08.1   
export RTE_TARGET=x86_64-native-linuxapp-gcc

cd $RTE_SDK
make config T=x86_64-native-linuxapp-gcc 
sed -ri 's,(PMD_PCAP=).*,\1y,' build/.config
make install T=x86_64-native-linuxapp-gcc

mkdir /mnt/huge
mount -t hugetlbfs nodev /mnt/huge  
export RTE_SDK=/root/dpdk-stable-17.08.1   
export RTE_TARGET=x86_64-native-linuxapp-gcc
