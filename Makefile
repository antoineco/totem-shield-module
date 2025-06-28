halves = totem_left.uf2 totem_right.uf2

.PHONY: all
all: $(halves)

.PHONY: init
init:
	west init -l config/
	west update
	west zephyr-export

$(halves):
	west build -s zmk/app -d .build_$(basename $@) -b seeeduino_xiao_ble -- -DZMK_CONFIG=config -DSHIELD=$(basename $@) -DZMK_EXTRA_MODULES='$(PWD)'
	cp .build_$(basename $@)/zephyr/zmk.uf2 $@

.PHONY: clean
clean:
	rm -rvf $(foreach d,$(halves),.build_$(basename $(d)))
	rm -vf $(halves)
