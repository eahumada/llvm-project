; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc  -O0 -mtriple=mipsel-linux-gnu -global-isel  -verify-machineinstrs %s -o -| FileCheck %s -check-prefixes=MIPS32

define i32 @sub_i32(i32 %x, i32 %y) {
; MIPS32-LABEL: sub_i32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    subu $2, $4, $5
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %z = sub i32 %x, %y
  ret i32 %z
}

define signext i8 @sub_i8_sext(i8 signext %a, i8 signext %b) {
; MIPS32-LABEL: sub_i8_sext:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    subu $1, $5, $4
; MIPS32-NEXT:    sll $1, $1, 24
; MIPS32-NEXT:    sra $2, $1, 24
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %sub = sub i8 %b, %a
  ret i8 %sub
}

define zeroext i8 @sub_i8_zext(i8 zeroext %a, i8 zeroext %b) {
; MIPS32-LABEL: sub_i8_zext:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    subu $1, $5, $4
; MIPS32-NEXT:    ori $2, $zero, 255
; MIPS32-NEXT:    and $2, $1, $2
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %sub = sub i8 %b, %a
  ret i8 %sub
}

define i8 @sub_i8_aext(i8 %a, i8 %b) {
; MIPS32-LABEL: sub_i8_aext:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    subu $2, $5, $4
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %sub = sub i8 %b, %a
  ret i8 %sub
}

define signext i16 @sub_i16_sext(i16 signext %a, i16 signext %b) {
; MIPS32-LABEL: sub_i16_sext:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    subu $1, $5, $4
; MIPS32-NEXT:    sll $1, $1, 16
; MIPS32-NEXT:    sra $2, $1, 16
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %sub = sub i16 %b, %a
  ret i16 %sub
}

define zeroext i16 @sub_i16_zext(i16 zeroext %a, i16 zeroext %b) {
; MIPS32-LABEL: sub_i16_zext:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    subu $1, $5, $4
; MIPS32-NEXT:    ori $2, $zero, 65535
; MIPS32-NEXT:    and $2, $1, $2
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %sub = sub i16 %b, %a
  ret i16 %sub
}

define i16 @sub_i16_aext(i16 %a, i16 %b) {
; MIPS32-LABEL: sub_i16_aext:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    subu $2, $5, $4
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %sub = sub i16 %b, %a
  ret i16 %sub
}

define i64 @sub_i64(i64 %a, i64 %b) {
; MIPS32-LABEL: sub_i64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    subu $2, $6, $4
; MIPS32-NEXT:    sltu $1, $6, $4
; MIPS32-NEXT:    subu $3, $7, $5
; MIPS32-NEXT:    ori $4, $zero, 1
; MIPS32-NEXT:    and $1, $1, $4
; MIPS32-NEXT:    subu $3, $3, $1
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %sub = sub i64 %b, %a
  ret i64 %sub
}

define i128 @sub_i128(i128 %a, i128 %b) {
; MIPS32-LABEL: sub_i128:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    addiu $1, $sp, 16
; MIPS32-NEXT:    lw $1, 0($1)
; MIPS32-NEXT:    addiu $2, $sp, 20
; MIPS32-NEXT:    lw $2, 0($2)
; MIPS32-NEXT:    addiu $3, $sp, 24
; MIPS32-NEXT:    lw $3, 0($3)
; MIPS32-NEXT:    addiu $8, $sp, 28
; MIPS32-NEXT:    lw $8, 0($8)
; MIPS32-NEXT:    subu $9, $1, $4
; MIPS32-NEXT:    sltu $1, $1, $4
; MIPS32-NEXT:    subu $4, $2, $5
; MIPS32-NEXT:    ori $10, $zero, 1
; MIPS32-NEXT:    and $10, $1, $10
; MIPS32-NEXT:    subu $4, $4, $10
; MIPS32-NEXT:    xor $10, $2, $5
; MIPS32-NEXT:    sltiu $10, $10, 1
; MIPS32-NEXT:    sltu $2, $2, $5
; MIPS32-NEXT:    ori $5, $zero, 1
; MIPS32-NEXT:    and $5, $10, $5
; MIPS32-NEXT:    movn $2, $1, $5
; MIPS32-NEXT:    subu $1, $3, $6
; MIPS32-NEXT:    ori $5, $zero, 1
; MIPS32-NEXT:    and $5, $2, $5
; MIPS32-NEXT:    subu $1, $1, $5
; MIPS32-NEXT:    xor $5, $3, $6
; MIPS32-NEXT:    sltiu $5, $5, 1
; MIPS32-NEXT:    sltu $3, $3, $6
; MIPS32-NEXT:    ori $6, $zero, 1
; MIPS32-NEXT:    and $5, $5, $6
; MIPS32-NEXT:    movn $3, $2, $5
; MIPS32-NEXT:    subu $2, $8, $7
; MIPS32-NEXT:    ori $5, $zero, 1
; MIPS32-NEXT:    and $3, $3, $5
; MIPS32-NEXT:    subu $5, $2, $3
; MIPS32-NEXT:    move $2, $9
; MIPS32-NEXT:    move $3, $4
; MIPS32-NEXT:    move $4, $1
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %sub = sub i128 %b, %a
  ret i128 %sub
}