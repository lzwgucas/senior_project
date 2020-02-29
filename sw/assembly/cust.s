	.file	"cust.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.hidden	main
	.type	main, @function
main:
.LFB1:
	.file 1 "cust.c"
	.loc 1 21 12
	.cfi_startproc
	.loc 1 24 1
.LVL0:
	.loc 1 25 1
	.loc 1 26 1
	.loc 1 27 1
	.loc 1 30 1
	.loc 1 33 1
	.loc 1 35 1
	.loc 1 36 1
	.loc 1 37 1
	.loc 1 43 1
.LBB12:
.LBB13:
	.loc 1 8 3
	.loc 1 9 3
	li	a5,45056
	li	a2,-300294144
	addi	a1,a5,-1125
	addi	a2,a2,1251
 #APP
# 9 "cust.c" 1
	.insn r CUSTOM_0, 0x7, 0, a2, a2, a1  

# 0 "" 2
	.loc 1 18 1
.LVL1:
 #NO_APP
.LBE13:
.LBE12:
	.loc 1 44 2
	.loc 1 44 7 is_stmt 0
	li	a3,49152
.LBB14:
.LBB15:
	.loc 1 9 3
	li	a5,-1162526720
.LBE15:
.LBE14:
	.loc 1 44 7
	sw	a2,16(a3)
.LVL2:
	.loc 1 47 1 is_stmt 1
.LBB17:
.LBB16:
	.loc 1 8 3
	.loc 1 9 3
	addi	a5,a5,-231
 #APP
# 9 "cust.c" 1
	.insn r CUSTOM_0, 0x7, 0, a5, a5, a1  

# 0 "" 2
	.loc 1 18 1
.LVL3:
 #NO_APP
.LBE16:
.LBE17:
	.loc 1 48 2
.LBB18:
.LBB19:
	.loc 1 9 3 is_stmt 0
	li	a4,1234567168
.LBE19:
.LBE18:
	.loc 1 48 7
	sw	a5,16(a3)
.LVL4:
	.loc 1 51 1 is_stmt 1
.LBB21:
.LBB20:
	.loc 1 8 3
	.loc 1 9 3
	addi	a4,a4,-45
 #APP
# 9 "cust.c" 1
	.insn r CUSTOM_0, 0x7, 0, a4, a4, a1  

# 0 "" 2
	.loc 1 18 1
.LVL5:
 #NO_APP
.LBE20:
.LBE21:
	.loc 1 52 2
	.loc 1 52 7 is_stmt 0
	sw	a4,16(a3)
.LVL6:
	.loc 1 56 1 is_stmt 1
.LBB22:
.LBB23:
	.loc 1 8 3
	.loc 1 9 3
.LBE23:
.LBE22:
	.loc 1 56 13 is_stmt 0
	mul	a5,a2,a5
.LVL7:
.LBB25:
.LBB24:
	.loc 1 9 3
 #APP
# 9 "cust.c" 1
	.insn r CUSTOM_0, 0x7, 0, a5, a5, a1  

# 0 "" 2
.LVL8:
	.loc 1 18 1 is_stmt 1
 #NO_APP
.LBE24:
.LBE25:
.LBB26:
.LBB27:
	.loc 1 8 3
	.loc 1 9 3
.LBE27:
.LBE26:
	.loc 1 56 5 is_stmt 0
	mul	a5,a4,a5
.LBB29:
.LBB28:
	.loc 1 9 3
 #APP
# 9 "cust.c" 1
	.insn r CUSTOM_0, 0x7, 0, a5, a5, a1  

# 0 "" 2
 #NO_APP
	sw	a5,a0.1513,a4
.LVL9:
	.loc 1 18 1 is_stmt 1
.LBE28:
.LBE29:
	.loc 1 57 1
	.loc 1 57 6 is_stmt 0
	sw	a5,16(a3)
	.loc 1 60 1 is_stmt 1
	.loc 1 63 6 is_stmt 0
	li	a5,28672
.LVL10:
	.loc 1 60 6
	sw	zero,16(a3)
.LVL11:
	.loc 1 62 1 is_stmt 1
	.loc 1 63 1
	.loc 1 63 6 is_stmt 0
	addi	a4,a5,-99
	sw	a4,16(a3)
	.loc 1 65 1 is_stmt 1
.LVL12:
	.loc 1 66 1
	.loc 1 66 6 is_stmt 0
	addi	a5,a5,-420
	sw	a5,16(a3)
	.loc 1 69 1 is_stmt 1
.LVL13:
	.loc 1 70 1
	.loc 1 70 6 is_stmt 0
	li	a5,16384
	addi	a5,a5,1777
	sw	a5,16(a3)
	.loc 1 74 1 is_stmt 1
.LVL14:
	.loc 1 75 1
	.loc 1 75 6 is_stmt 0
	li	a5,36864
	addi	a5,a5,-1265
	sw	a5,16(a3)
	.loc 1 77 1 is_stmt 1
	.loc 1 77 6 is_stmt 0
	sw	zero,16(a3)
	.loc 1 79 1 is_stmt 1
	.loc 1 80 1 is_stmt 0
	li	a0,0
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.sbss,"aw",@nobits
	.align	2
	.type	a0.1513, @object
	.size	a0.1513, 4
a0.1513:
	.zero	4
	.text
.Letext0:
	.file 2 "/opt/riscv/riscv32-unknown-elf/include/machine/_default_types.h"
	.file 3 "/opt/riscv/riscv32-unknown-elf/include/sys/_stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x22a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF11
	.byte	0xc
	.4byte	.LASF12
	.4byte	.LASF13
	.4byte	.Ldebug_ranges0+0x60
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.byte	0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x69
	.byte	0x19
	.4byte	0x25
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x5
	.4byte	0x70
	.byte	0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x64
	.byte	0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0x15
	.byte	0x5
	.4byte	0x2c
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x1f2
	.byte	0x7
	.string	"a"
	.byte	0x1
	.byte	0x18
	.byte	0xc
	.4byte	0x7c
	.4byte	0xee19e4e3
	.byte	0x7
	.string	"b"
	.byte	0x1
	.byte	0x19
	.byte	0xc
	.4byte	0x7c
	.4byte	0xbab53f19
	.byte	0x7
	.string	"c"
	.byte	0x1
	.byte	0x1a
	.byte	0xc
	.4byte	0x7c
	.4byte	0x4995ffd3
	.byte	0x8
	.string	"m"
	.byte	0x1
	.byte	0x1b
	.byte	0xc
	.4byte	0x7c
	.2byte	0xab9b
	.byte	0x8
	.string	"var"
	.byte	0x1
	.byte	0x1e
	.byte	0x19
	.4byte	0x1f2
	.2byte	0xc010
	.byte	0x9
	.string	"x"
	.byte	0x1
	.byte	0x21
	.byte	0xa
	.4byte	0x7c
	.4byte	.LLST0
	.byte	0x9
	.string	"i"
	.byte	0x1
	.byte	0x23
	.byte	0xb
	.4byte	0x7c
	.4byte	.LLST1
	.byte	0x9
	.string	"k"
	.byte	0x1
	.byte	0x24
	.byte	0xb
	.4byte	0x7c
	.4byte	.LLST2
	.byte	0x9
	.string	"j"
	.byte	0x1
	.byte	0x25
	.byte	0xb
	.4byte	0x7c
	.4byte	.LLST3
	.byte	0xa
	.4byte	0x1f8
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x1
	.byte	0x2b
	.byte	0x5
	.4byte	0x145
	.byte	0xb
	.4byte	0x210
	.4byte	.LLST4
	.byte	0xb
	.4byte	0x205
	.4byte	.LLST5
	.byte	0
	.byte	0xc
	.4byte	0x1f8
	.4byte	.LBB14
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x2f
	.byte	0x5
	.4byte	0x171
	.byte	0xb
	.4byte	0x210
	.4byte	.LLST6
	.byte	0xb
	.4byte	0x205
	.4byte	.LLST7
	.byte	0xd
	.4byte	.Ldebug_ranges0+0
	.byte	0
	.byte	0xc
	.4byte	0x1f8
	.4byte	.LBB18
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0x33
	.byte	0x4
	.4byte	0x19d
	.byte	0xb
	.4byte	0x210
	.4byte	.LLST8
	.byte	0xb
	.4byte	0x205
	.4byte	.LLST9
	.byte	0xd
	.4byte	.Ldebug_ranges0+0x18
	.byte	0
	.byte	0xc
	.4byte	0x1f8
	.4byte	.LBB22
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x38
	.byte	0xd
	.4byte	0x1c9
	.byte	0xb
	.4byte	0x210
	.4byte	.LLST10
	.byte	0xb
	.4byte	0x205
	.4byte	.LLST11
	.byte	0xd
	.4byte	.Ldebug_ranges0+0x30
	.byte	0
	.byte	0xe
	.4byte	0x1f8
	.4byte	.LBB26
	.4byte	.Ldebug_ranges0+0x48
	.byte	0x1
	.byte	0x38
	.byte	0x5
	.byte	0xb
	.4byte	0x210
	.4byte	.LLST12
	.byte	0xb
	.4byte	0x205
	.4byte	.LLST13
	.byte	0xd
	.4byte	.Ldebug_ranges0+0x48
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x77
	.byte	0x10
	.4byte	.LASF15
	.byte	0x1
	.byte	0x7
	.byte	0xc
	.4byte	0x2c
	.byte	0x1
	.byte	0x11
	.string	"a1"
	.byte	0x1
	.byte	0x7
	.byte	0x20
	.4byte	0x70
	.byte	0x11
	.string	"a2"
	.byte	0x1
	.byte	0x7
	.byte	0x31
	.4byte	0x70
	.byte	0x12
	.string	"a0"
	.byte	0x1
	.byte	0x8
	.byte	0xe
	.4byte	0x2c
	.byte	0x5
	.byte	0x3
	.4byte	a0.1513
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xb
	.byte	0
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x7
	.byte	0x7f
	.byte	0
	.byte	0xf7
	.byte	0x2c
	.byte	0xf7
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x8
	.byte	0x7d
	.byte	0x10
	.byte	0x6
	.byte	0xf7
	.byte	0x2c
	.byte	0xf7
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE1
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x8b0f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x1
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0xb
	.byte	0x3
	.4byte	a0.1513
	.byte	0x6
	.byte	0xf7
	.byte	0x2c
	.byte	0xf7
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LFE1
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x6f9d
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x1
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0xb
	.byte	0x3
	.4byte	a0.1513
	.byte	0x6
	.byte	0xf7
	.byte	0x2c
	.byte	0xf7
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LFE1
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x6e5c
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0
	.4byte	.LVL5
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x1
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0xb
	.byte	0x3
	.4byte	a0.1513
	.byte	0x6
	.byte	0xf7
	.byte	0x2c
	.byte	0xf7
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LFE1
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x46f1
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x4
	.byte	0xa
	.2byte	0xab9b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x6
	.byte	0x9e
	.byte	0x4
	.4byte	0xee19e4e3
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x4
	.byte	0xa
	.2byte	0xab9b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x6
	.byte	0x9e
	.byte	0x4
	.4byte	0xbab53f19
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x4
	.byte	0xa
	.2byte	0xab9b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x6
	.byte	0xc
	.4byte	0x4995ffd3
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x4
	.byte	0xa
	.2byte	0xab9b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x6
	.byte	0x7c
	.byte	0
	.byte	0x7f
	.byte	0
	.byte	0x1e
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x4
	.byte	0xa
	.2byte	0xab9b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0xa
	.byte	0x3
	.4byte	a0.1513
	.byte	0x6
	.byte	0x7e
	.byte	0
	.byte	0x1e
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB14
	.4byte	.LBE14
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	0
	.4byte	0
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	0
	.4byte	0
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	0
	.4byte	0
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	.LBB29
	.4byte	.LBE29
	.4byte	0
	.4byte	0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"custom"
.LASF10:
	.string	"uint64_t"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF4:
	.string	"short unsigned int"
.LASF14:
	.string	"main"
.LASF8:
	.string	"unsigned int"
.LASF0:
	.string	"long long unsigned int"
.LASF12:
	.string	"cust.c"
.LASF7:
	.string	"long long int"
.LASF11:
	.string	"GNU C17 9.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -mtune=rocket -g -Os -fvisibility=hidden"
.LASF13:
	.string	"/home/topalc/Desktop/ibex-master/examples/sw/assembly"
.LASF3:
	.string	"short int"
.LASF9:
	.string	"__uint64_t"
.LASF5:
	.string	"long int"
.LASF1:
	.string	"signed char"
	.ident	"GCC: (GNU) 9.2.0"
