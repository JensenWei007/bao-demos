baremetal2_src:=$(wrkdir_src)/baremetal2
baremetal2_repo:=https://github.com/JensenWei007/bao-baremetal-guest.git
baremetal2_branch:=vm1

$(baremetal2_src):
	git clone $(baremetal2_repo) $@ --branch $(baremetal2_branch)

baremetal2_bin:=$(baremetal2_src)/build/$(PLATFORM)/baremetal.bin

define build-baremetal2
$(strip $1): $(baremetal2_src)
	$(MAKE) -C $(baremetal2_src) PLATFORM=$(PLATFORM)
	cp $(baremetal2_bin) $$@
	${CROSS_COMPILE}objcopy -O ihex $(baremetal2_src)/build/${PLATFORM}/baremetal.elf $(strip $3)
endef
