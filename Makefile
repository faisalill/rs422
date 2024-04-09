default:
	iverilog -o test_bench tb.v rs232.v rs424.v \
	&& vvp  test_bench
