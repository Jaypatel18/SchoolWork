transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/jbpatel/Spring\ 2015\ CPRE/Lab04/lab04work {/home/jbpatel/Spring 2015 CPRE/Lab04/lab04work/Normal.v}
vlog -vlog01compat -work work +incdir+/home/jbpatel/Spring\ 2015\ CPRE/Lab04/lab04work {/home/jbpatel/Spring 2015 CPRE/Lab04/lab04work/power_saving.v}
vlog -vlog01compat -work work +incdir+/home/jbpatel/Spring\ 2015\ CPRE/Lab04/lab04work {/home/jbpatel/Spring 2015 CPRE/Lab04/lab04work/multiplexer.v}

