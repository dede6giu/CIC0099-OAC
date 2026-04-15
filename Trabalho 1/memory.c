#include <stdint.h>
#include <stdio.h>

// 2^14 adresses of bytes
#define MEM_SIZE 16384
int8_t mem[MEM_SIZE];

// Read a byte in memory, convert it into int32_t
// and return it
int32_t lb(const uint32_t reg, int32_t kte) {
    return mem[reg+kte];
}

// Read a byte in memory, convert it into uint32_t
// and return it
uint32_t lbu(const uint32_t reg, int32_t kte) {
    uint8_t add = mem[reg+kte];
    return add;
}

// Read a word in memory, return it
int32_t lw(const uint32_t reg, int32_t kte) {
    int32_t res = 0;
    
    uint8_t i = 4;
    while (1) {
        i--;
        uint8_t add = mem[reg+kte+i];
        res += add; // This could probably be a |=
        if (i == 0) break;
        res <<= 8;
    }

    return res;
}

// Write a byte in memory
void sb(const uint32_t reg, int32_t kte, int8_t data) {
    mem[reg+kte] = data;
}

// Write a word in memory
void sw(const uint32_t reg, int32_t kte, int32_t data) {
    for (uint8_t i = 0; i < 4; i++) {
        mem[reg+kte+i] = data & 0xFF;
        data >>= 8;
    }
}

int main(void) {

    sb(0, 0, 0x04);
    sb(0, 1, 0x03);
    sb(0, 2, 0x02);
    sb(0, 3, 0x01);

    sb(512, 0, 0xFE);
    sb(512, 1, 0xCA);
    sb(512, 2, 0xCA);
    sb(512, 3, 0xFA);

    sw(8, 0, 0xFF);

    sw(12, 0, 0xDAD0BEBE);

    printf("%08x\n", lw(0, 0));             
    printf("%08x\n", lw(512, 0));  
    printf("%08x\n", lb(512,0));       
    printf("%08x\n", lbu(512,1));      
    printf("%08x\n", lw(8, 0));             
    printf("%08x\n", lw(12, 0)); 

    /*
    01020304
    facacafe
    fffffffe
    000000ca
    000000ff
    dad0bebe
    */

    return 0;
}