runtime_id=$(( (RANDOM % 10000) + 1 ))
cross_compiler="/media/balo/256GB/piekernel/kernel/samsung/golden/toolchain/bin/arm-eabi-"
local_path=/media/balo/256GB/S3-MINI/lineage-16
echo "Runtime id is: $runtime_id"
echo "--> [0/3 done] Cleaning up..."
make O=$local_path/out mrproper > $local_path/logs/log-$runtime_id-1.txt 2>&1
clear
echo "Runtime id is: $runtime_id"
echo "--> [1/3 done] Done!"
clear
echo "Runtime id is: $runtime_id"
echo "--> [1/3 done] Using defconfig: golden_defconfig"
make O=$local_path/out golden_defconfig > $local_path/logs/log-$runtime_id-2.txt 2>&1
clear
echo "Runtime id is: $runtime_id"
echo "--> [2/3 done] config created!"
clear
echo "Runtime id is: $runtime_id"
echo "--> [2/3 done] Now let the real compiling begin! Logs saving to: log.txt"
clear
echo "Runtime id is: $runtime_id"
echo "--> [2/3 done]Now compiling please be paitent!"
make O=$local_path/out ARCH=arm CROSS_COMPILE=$cross_compiler -j5 -k > $local_path/logs/log-$runtime_id-3.txt 2>&1
clear
echo "Runtime id is: $runtime_id"
echo "--> [3/3 done] Done! Not sure if it had succseed, check logs/log-{Runtime id}-*.txt for info."
