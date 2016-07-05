#!/bin/bash

RED=`tput setaf 1; tput bold`
GREEN=`tput setaf 2; tput bold`
NC=`tput sgr0`

# ndks=("android-ndk-r8b")
ndks=("/home/maksim/android-ndk-r10e" "/home/maksim/android-ndk-r8d")
# ndks=$(ls -1 | grep android-ndk)
# "-mfloat-abi=softfp"
# options=("-mfloat-abi=soft" "-mfloat-abi=softfp -mfpu=neon" "-mfloat-abi=hard -mfpu=neon")
options=(\
    "-mfloat-abi=soft" \
    "-mfloat-abi=softfp -mfpu=neon" \
    "-mfloat-abi=hard -mfpu=neon" \
    "-mfloat-abi=soft -mfpu=vfpv4" \
    "-mfloat-abi=softfp -mfpu=vfpv4" \
    "-mfloat-abi=hard -mfpu=vfpv4" \
    "-mfloat-abi=soft -mfpu=vfpv3-d16" \
    "-mfloat-abi=softfp -mfpu=vfpv3-d16" \
    "-mfloat-abi=hard -mfpu=vfpv3-d16" \
    "-mfloat-abi=soft -mfpu=vfp" \
    "-mfloat-abi=softfp -mfpu=vfp" \
    "-mfloat-abi=hard -mfpu=vfp" \
    )

common="-fexceptions -fpic -funwind-tables  -fsigned-char -no-canonical-prefixes \
    -march=armv7-a -fdata-sections -ffunction-sections -fsigned-char -W -Wall \
    -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point \
    -Wformat -Werror=format-security -Wmissing-declarations -Wundef -Winit-self \
    -Wpointer-arith -Wshadow  -fdiagnostics-show-option -fomit-frame-pointer \
     -fomit-frame-pointer -fno-strict-aliasing -O3 -DNDEBUG  -DNDEBUG"

# for ndk in ${ndks[@]} ; do
# ndk=$(cd $ndk ; pwd)
# chains=$(ls -1 $ndk/toolchains | grep arm-linux | grep -v clang)
# for chain in ${chains[@]} ; do
# for option in "${options[@]}" ; do
#     tool=$(find $ndk/toolchains/$chain -name 'arm*g++')
#     echo
#     echo " ||| NDK: $ndk"
#     echo " ||| Toolchain: $chain"
#     echo " ||| Option: $option"
#     $tool $common $option -dM -E - < /dev/null | egrep -i "arm|vfp|neon|soft|arch|ver" | sort
#     # $tool $common $option -dM -E - < /dev/null
#     $tool $common $option -c test.cpp
#     if [ $? == 0 ] ; then
#         objdump -d test.o
#         echo "${GREEN}====== Compilation successful!!! =========${NC}"
#     else
#         echo "${RED}========= Compilation FAILED =========${NC}"
#     fi
# done
# done
# done

# options=("--arm-float-abi=soft" "--arm-float-abi=softfp --arm-fpu=neon" "--arm-float-abi=hard --arm-fpu=neon")

# targets=("arm-none-linux-gnueabi" "arm-none-linux-android")
# for target in ${targets[@]} ; do
# for option in "${options[@]}" ; do
#     echo
#     echo " ||| Tool: clang"
#     echo " ||| Target: $target"
#     echo " ||| Option: $option"
#     /usr/bin/clang++ -target $target $common $option -dM -E - < /dev/null | egrep -i "arm|vfp|neon|soft"
#     /usr/bin/clang++ -target $target $common $option -c test.cpp
#     if [ $? == 0 ] ; then
#         objdump -d test.o
#         echo "${GREEN}====== Compilation successful!!! =========${NC}"
#     else
#         echo "${RED}========= Compilation FAILED =========${NC}"
#     fi
# done
# done
