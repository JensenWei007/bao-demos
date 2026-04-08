baremetal1_src:=$(wrkdir_src)/baremetal1
baremetal1_repo:=https://github.com/JensenWei007/bao-baremetal-guest.git
baremetal1_branch:=vm0

$(baremetal1_src):
	git clone $(baremetal1_repo) $@ --branch $(baremetal1_branch)

baremetal1_bin:=$(baremetal1_src)/build/$(PLATFORM)/baremetal.bin

define build-baremetal1
$(strip $1): $(baremetal1_src)
	$(MAKE) -C $(baremetal1_src) PLATFORM=$(PLATFORM)
	cp $(baremetal1_bin) $$@
	${CROSS_COMPILE}objcopy -O ihex $(baremetal1_src)/build/${PLATFORM}/baremetal.elf $(strip $3)
endef
