gst-launch-0.10 --gst-disable-segtrap --gst-debug-level=2 --gst-plugin-load=.libs/libgstpeaq.so \
	filesrc name=src0 location="ref.wav" \
	wavparse name=parse0 \
	audioconvert name=convert0 \
	filesrc name=src1 location="test.wav" \
	wavparse name=parse1 \
	audioconvert name=convert1 \
	peaq name=peaq \
	src0.src\!parse0.sink src1.src\!parse1.sink \
	parse0.src\!convert0.sink parse1.src\!convert1.sink \
	convert0.src\!peaq.ref convert1.src\!peaq.test