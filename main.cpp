extern "C" {
    #include "toy.h"
}
#include <stdint.h>
#include <fuzzer/FuzzedDataProvider.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
 	FuzzedDataProvider fpd(data, size);
	std::string s = fpd.ConsumeRandomLengthString();
	eval_source(s.c_str());
	return 0;
}
