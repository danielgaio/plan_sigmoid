transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/daniel/Documents/GitHub/pwla_sigmoid {/home/daniel/Documents/GitHub/pwla_sigmoid/pwla_sigmoid.sv}
