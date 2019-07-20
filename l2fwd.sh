export RTE_SDK=/root/dpdk-stable-17.08.1   
cd $RTE_SDK/examples/l2fwd
make
./build/l2fwd -l 0-3 -n 4 -- -q 8 -p 0x3
