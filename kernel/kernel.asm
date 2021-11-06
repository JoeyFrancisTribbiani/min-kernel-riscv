
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00001117          	auipc	sp,0x1
    80000004:	15010113          	addi	sp,sp,336 # 80001150 <stack0>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	006000ef          	jal	ra,8000001c <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <start>:
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
    80000022:	6b6377b7          	lui	a5,0x6b637
    80000026:	5667879b          	addiw	a5,a5,1382
    8000002a:	fef42423          	sw	a5,-24(s0)
    8000002e:	00001797          	auipc	a5,0x1
    80000032:	fc07b923          	sd	zero,-46(a5) # 80001000 <_trampoline>
    80000036:	00001717          	auipc	a4,0x1
    8000003a:	fca70713          	addi	a4,a4,-54 # 80001000 <_trampoline>
    8000003e:	10000637          	lui	a2,0x10000
    80000042:	4691                	li	a3,4
    80000044:	631c                	ld	a5,0(a4)
    80000046:	ff040593          	addi	a1,s0,-16
    8000004a:	97ae                	add	a5,a5,a1
    8000004c:	ff87c783          	lbu	a5,-8(a5)
    80000050:	00f60023          	sb	a5,0(a2) # 10000000 <_entry-0x70000000>
    80000054:	631c                	ld	a5,0(a4)
    80000056:	0785                	addi	a5,a5,1
    80000058:	e31c                	sd	a5,0(a4)
    8000005a:	fed795e3          	bne	a5,a3,80000044 <start+0x28>
    8000005e:	00073023          	sd	zero,0(a4)
    80000062:	b7cd                	j	80000044 <start+0x28>
	...
