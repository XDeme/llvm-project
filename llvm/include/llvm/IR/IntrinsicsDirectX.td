//===- IntrinsicsDirectX.td - Defines DirectX intrinsics ---*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines all of the DirectX-specific intrinsics.
//
//===----------------------------------------------------------------------===//

let TargetPrefix = "dx" in {

def int_dx_thread_id : Intrinsic<[llvm_i32_ty], [llvm_i32_ty], [IntrNoMem, IntrWillReturn]>;
def int_dx_group_id : Intrinsic<[llvm_i32_ty], [llvm_i32_ty], [IntrNoMem, IntrWillReturn]>;
def int_dx_thread_id_in_group : Intrinsic<[llvm_i32_ty], [llvm_i32_ty], [IntrNoMem, IntrWillReturn]>;
def int_dx_flattened_thread_id_in_group : Intrinsic<[llvm_i32_ty], [], [IntrNoMem, IntrWillReturn]>;

def int_dx_create_handle : ClangBuiltin<"__builtin_hlsl_create_handle">,
    Intrinsic<[ llvm_ptr_ty ], [llvm_i8_ty], [IntrWillReturn]>;

def int_dx_dot : 
    Intrinsic<[LLVMVectorElementType<0>], 
    [llvm_anyvector_ty, LLVMScalarOrSameVectorWidth<0, LLVMVectorElementType<0>>],
    [IntrNoMem, IntrWillReturn, Commutative] >;

def int_dx_frac  : DefaultAttrsIntrinsic<[llvm_anyfloat_ty], [LLVMMatchType<0>]>;

def int_dx_lerp :
    Intrinsic<[LLVMScalarOrSameVectorWidth<0, LLVMVectorElementType<0>>],
    [llvm_anyvector_ty, LLVMScalarOrSameVectorWidth<0, LLVMVectorElementType<0>>,LLVMScalarOrSameVectorWidth<0, LLVMVectorElementType<0>>],
    [IntrNoMem, IntrWillReturn] >;
}
