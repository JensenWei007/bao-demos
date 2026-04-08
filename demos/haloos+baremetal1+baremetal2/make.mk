include $(bao_demos)/guests/baremetal1/make.mk
include $(bao_demos)/guests/baremetal2/make.mk

baremetal1_image:=$(wrkdir_demo_imgs)/baremetal1.bin
baremetal2_image:=$(wrkdir_demo_imgs)/baremetal2.bin

baremetal1_hex:=$(wrkdir_demo_imgs)/baremetal1.hex
baremetal2_hex:=$(wrkdir_demo_imgs)/baremetal2.hex

app_src_dir:=$(bao_demos)/demos/haloos+baremetal1+baremetal2/src
baremetal_args:=APP_SRC_DIR=$(app_src_dir)

$(eval $(call build-baremetal1, $(baremetal1_image), $(baremetal_args), $(baremetal1_hex)))
$(eval $(call build-baremetal2, $(baremetal2_image), $(baremetal_args), $(baremetal2_hex)))

guest_images:=$(baremetal1_image) $(baremetal2_image)
