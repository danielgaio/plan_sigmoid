transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/daniel/Documents/GitHub/plan_sigmoid/hdl {/home/daniel/Documents/GitHub/plan_sigmoid/hdl/pwla_sigmoid.sv}

