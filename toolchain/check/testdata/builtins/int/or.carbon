// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/builtins/int/or.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/builtins/int/or.carbon

// --- int_or.carbon

fn Or(a: i32, b: i32) -> i32 = "int.or";

var arr: [i32; Or(12, 10)];
let arr_p: [i32; 14]* = &arr;

fn RuntimeCall(a: i32, b: i32) -> i32 {
  return Or(a, b);
}

// CHECK:STDOUT: --- int_or.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %.1: Core.IntLiteral = int_value 32 [template]
// CHECK:STDOUT:   %Int.type: type = fn_type @Int [template]
// CHECK:STDOUT:   %Int: %Int.type = struct_value () [template]
// CHECK:STDOUT:   %i32: type = int_type signed, %.1 [template]
// CHECK:STDOUT:   %Or.type: type = fn_type @Or [template]
// CHECK:STDOUT:   %Or: %Or.type = struct_value () [template]
// CHECK:STDOUT:   %.2: Core.IntLiteral = int_value 12 [template]
// CHECK:STDOUT:   %.3: Core.IntLiteral = int_value 10 [template]
// CHECK:STDOUT:   %Convert.type.2: type = fn_type @Convert.1, @ImplicitAs(%i32) [template]
// CHECK:STDOUT:   %Convert.type.6: type = fn_type @Convert.1, @ImplicitAs(Core.IntLiteral) [template]
// CHECK:STDOUT:   %Convert.type.14: type = fn_type @Convert.2, @impl.1(%.1) [template]
// CHECK:STDOUT:   %Convert.14: %Convert.type.14 = struct_value () [template]
// CHECK:STDOUT:   %.23: <witness> = interface_witness (%Convert.14) [template]
// CHECK:STDOUT:   %.24: <bound method> = bound_method %.2, %Convert.14 [template]
// CHECK:STDOUT:   %.25: <specific function> = specific_function %.24, @Convert.2(%.1) [template]
// CHECK:STDOUT:   %.26: %i32 = int_value 12 [template]
// CHECK:STDOUT:   %.27: <bound method> = bound_method %.3, %Convert.14 [template]
// CHECK:STDOUT:   %.28: <specific function> = specific_function %.27, @Convert.2(%.1) [template]
// CHECK:STDOUT:   %.29: %i32 = int_value 10 [template]
// CHECK:STDOUT:   %.30: %i32 = int_value 14 [template]
// CHECK:STDOUT:   %Convert.type.15: type = fn_type @Convert.4, @impl.3(%.1) [template]
// CHECK:STDOUT:   %Convert.15: %Convert.type.15 = struct_value () [template]
// CHECK:STDOUT:   %.31: <witness> = interface_witness (%Convert.15) [template]
// CHECK:STDOUT:   %.32: <bound method> = bound_method %.30, %Convert.15 [template]
// CHECK:STDOUT:   %.33: <specific function> = specific_function %.32, @Convert.4(%.1) [template]
// CHECK:STDOUT:   %.34: Core.IntLiteral = int_value 14 [template]
// CHECK:STDOUT:   %.35: type = array_type %.34, %i32 [template]
// CHECK:STDOUT:   %.36: type = ptr_type %.35 [template]
// CHECK:STDOUT:   %RuntimeCall.type: type = fn_type @RuntimeCall [template]
// CHECK:STDOUT:   %RuntimeCall: %RuntimeCall.type = struct_value () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: imports {
// CHECK:STDOUT:   %Core: <namespace> = namespace file.%Core.import, [template] {
// CHECK:STDOUT:     .Int = %import_ref.1
// CHECK:STDOUT:     .ImplicitAs = %import_ref.2
// CHECK:STDOUT:     import Core//prelude
// CHECK:STDOUT:     import Core//prelude/...
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = imports.%Core
// CHECK:STDOUT:     .Or = %Or.decl
// CHECK:STDOUT:     .arr = %arr
// CHECK:STDOUT:     .arr_p = @__global_init.%arr_p
// CHECK:STDOUT:     .RuntimeCall = %RuntimeCall.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %Or.decl: %Or.type = fn_decl @Or [template = constants.%Or] {
// CHECK:STDOUT:     %a.patt: %i32 = binding_pattern a
// CHECK:STDOUT:     %a.param_patt: %i32 = value_param_pattern %a.patt, runtime_param0
// CHECK:STDOUT:     %b.patt: %i32 = binding_pattern b
// CHECK:STDOUT:     %b.param_patt: %i32 = value_param_pattern %b.patt, runtime_param1
// CHECK:STDOUT:     %return.patt: %i32 = return_slot_pattern
// CHECK:STDOUT:     %return.param_patt: %i32 = out_param_pattern %return.patt, runtime_param2
// CHECK:STDOUT:   } {
// CHECK:STDOUT:     %.loc2_10.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:     %int.make_type_signed.loc2_10: init type = call constants.%Int(%.loc2_10.1) [template = constants.%i32]
// CHECK:STDOUT:     %.loc2_10.2: type = value_of_initializer %int.make_type_signed.loc2_10 [template = constants.%i32]
// CHECK:STDOUT:     %.loc2_10.3: type = converted %int.make_type_signed.loc2_10, %.loc2_10.2 [template = constants.%i32]
// CHECK:STDOUT:     %.loc2_18.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:     %int.make_type_signed.loc2_18: init type = call constants.%Int(%.loc2_18.1) [template = constants.%i32]
// CHECK:STDOUT:     %.loc2_18.2: type = value_of_initializer %int.make_type_signed.loc2_18 [template = constants.%i32]
// CHECK:STDOUT:     %.loc2_18.3: type = converted %int.make_type_signed.loc2_18, %.loc2_18.2 [template = constants.%i32]
// CHECK:STDOUT:     %.loc2_26.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:     %int.make_type_signed.loc2_26: init type = call constants.%Int(%.loc2_26.1) [template = constants.%i32]
// CHECK:STDOUT:     %.loc2_26.2: type = value_of_initializer %int.make_type_signed.loc2_26 [template = constants.%i32]
// CHECK:STDOUT:     %.loc2_26.3: type = converted %int.make_type_signed.loc2_26, %.loc2_26.2 [template = constants.%i32]
// CHECK:STDOUT:     %a.param: %i32 = value_param runtime_param0
// CHECK:STDOUT:     %a: %i32 = bind_name a, %a.param
// CHECK:STDOUT:     %b.param: %i32 = value_param runtime_param1
// CHECK:STDOUT:     %b: %i32 = bind_name b, %b.param
// CHECK:STDOUT:     %return.param: ref %i32 = out_param runtime_param2
// CHECK:STDOUT:     %return: ref %i32 = return_slot %return.param
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %.loc4_11.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:   %int.make_type_signed.loc4: init type = call constants.%Int(%.loc4_11.1) [template = constants.%i32]
// CHECK:STDOUT:   %Or.ref: %Or.type = name_ref Or, %Or.decl [template = constants.%Or]
// CHECK:STDOUT:   %.loc4_19.1: Core.IntLiteral = int_value 12 [template = constants.%.2]
// CHECK:STDOUT:   %.loc4_23.1: Core.IntLiteral = int_value 10 [template = constants.%.3]
// CHECK:STDOUT:   %.loc4_19.2: %Convert.type.2 = interface_witness_access constants.%.23, element0 [template = constants.%Convert.14]
// CHECK:STDOUT:   %.loc4_19.3: <bound method> = bound_method %.loc4_19.1, %.loc4_19.2 [template = constants.%.24]
// CHECK:STDOUT:   %.loc4_19.4: <specific function> = specific_function %.loc4_19.3, @Convert.2(constants.%.1) [template = constants.%.25]
// CHECK:STDOUT:   %int.convert_checked.loc4_19: init %i32 = call %.loc4_19.4(%.loc4_19.1) [template = constants.%.26]
// CHECK:STDOUT:   %.loc4_19.5: %i32 = value_of_initializer %int.convert_checked.loc4_19 [template = constants.%.26]
// CHECK:STDOUT:   %.loc4_19.6: %i32 = converted %.loc4_19.1, %.loc4_19.5 [template = constants.%.26]
// CHECK:STDOUT:   %.loc4_23.2: %Convert.type.2 = interface_witness_access constants.%.23, element0 [template = constants.%Convert.14]
// CHECK:STDOUT:   %.loc4_23.3: <bound method> = bound_method %.loc4_23.1, %.loc4_23.2 [template = constants.%.27]
// CHECK:STDOUT:   %.loc4_23.4: <specific function> = specific_function %.loc4_23.3, @Convert.2(constants.%.1) [template = constants.%.28]
// CHECK:STDOUT:   %int.convert_checked.loc4_23: init %i32 = call %.loc4_23.4(%.loc4_23.1) [template = constants.%.29]
// CHECK:STDOUT:   %.loc4_23.5: %i32 = value_of_initializer %int.convert_checked.loc4_23 [template = constants.%.29]
// CHECK:STDOUT:   %.loc4_23.6: %i32 = converted %.loc4_23.1, %.loc4_23.5 [template = constants.%.29]
// CHECK:STDOUT:   %int.or: init %i32 = call %Or.ref(%.loc4_19.6, %.loc4_23.6) [template = constants.%.30]
// CHECK:STDOUT:   %.loc4_11.2: type = value_of_initializer %int.make_type_signed.loc4 [template = constants.%i32]
// CHECK:STDOUT:   %.loc4_11.3: type = converted %int.make_type_signed.loc4, %.loc4_11.2 [template = constants.%i32]
// CHECK:STDOUT:   %.loc4_18.1: %Convert.type.6 = interface_witness_access constants.%.31, element0 [template = constants.%Convert.15]
// CHECK:STDOUT:   %.loc4_18.2: <bound method> = bound_method %int.or, %.loc4_18.1 [template = constants.%.32]
// CHECK:STDOUT:   %.loc4_18.3: <specific function> = specific_function %.loc4_18.2, @Convert.4(constants.%.1) [template = constants.%.33]
// CHECK:STDOUT:   %.loc4_18.4: %i32 = value_of_initializer %int.or [template = constants.%.30]
// CHECK:STDOUT:   %.loc4_18.5: %i32 = converted %int.or, %.loc4_18.4 [template = constants.%.30]
// CHECK:STDOUT:   %int.convert_checked.loc4_18: init Core.IntLiteral = call %.loc4_18.3(%.loc4_18.5) [template = constants.%.34]
// CHECK:STDOUT:   %.loc4_18.6: Core.IntLiteral = value_of_initializer %int.convert_checked.loc4_18 [template = constants.%.34]
// CHECK:STDOUT:   %.loc4_18.7: Core.IntLiteral = converted %int.or, %.loc4_18.6 [template = constants.%.34]
// CHECK:STDOUT:   %.loc4_26: type = array_type %.loc4_18.7, %i32 [template = constants.%.35]
// CHECK:STDOUT:   %arr.var: ref %.35 = var arr
// CHECK:STDOUT:   %arr: ref %.35 = bind_name arr, %arr.var
// CHECK:STDOUT:   %.loc5_13.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:   %int.make_type_signed.loc5: init type = call constants.%Int(%.loc5_13.1) [template = constants.%i32]
// CHECK:STDOUT:   %.loc5_18: Core.IntLiteral = int_value 14 [template = constants.%.34]
// CHECK:STDOUT:   %.loc5_13.2: type = value_of_initializer %int.make_type_signed.loc5 [template = constants.%i32]
// CHECK:STDOUT:   %.loc5_13.3: type = converted %int.make_type_signed.loc5, %.loc5_13.2 [template = constants.%i32]
// CHECK:STDOUT:   %.loc5_20: type = array_type %.loc5_18, %i32 [template = constants.%.35]
// CHECK:STDOUT:   %.loc5_21: type = ptr_type %.35 [template = constants.%.36]
// CHECK:STDOUT:   %RuntimeCall.decl: %RuntimeCall.type = fn_decl @RuntimeCall [template = constants.%RuntimeCall] {
// CHECK:STDOUT:     %a.patt: %i32 = binding_pattern a
// CHECK:STDOUT:     %a.param_patt: %i32 = value_param_pattern %a.patt, runtime_param0
// CHECK:STDOUT:     %b.patt: %i32 = binding_pattern b
// CHECK:STDOUT:     %b.param_patt: %i32 = value_param_pattern %b.patt, runtime_param1
// CHECK:STDOUT:     %return.patt: %i32 = return_slot_pattern
// CHECK:STDOUT:     %return.param_patt: %i32 = out_param_pattern %return.patt, runtime_param2
// CHECK:STDOUT:   } {
// CHECK:STDOUT:     %.loc7_19.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:     %int.make_type_signed.loc7_19: init type = call constants.%Int(%.loc7_19.1) [template = constants.%i32]
// CHECK:STDOUT:     %.loc7_19.2: type = value_of_initializer %int.make_type_signed.loc7_19 [template = constants.%i32]
// CHECK:STDOUT:     %.loc7_19.3: type = converted %int.make_type_signed.loc7_19, %.loc7_19.2 [template = constants.%i32]
// CHECK:STDOUT:     %.loc7_27.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:     %int.make_type_signed.loc7_27: init type = call constants.%Int(%.loc7_27.1) [template = constants.%i32]
// CHECK:STDOUT:     %.loc7_27.2: type = value_of_initializer %int.make_type_signed.loc7_27 [template = constants.%i32]
// CHECK:STDOUT:     %.loc7_27.3: type = converted %int.make_type_signed.loc7_27, %.loc7_27.2 [template = constants.%i32]
// CHECK:STDOUT:     %.loc7_35.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:     %int.make_type_signed.loc7_35: init type = call constants.%Int(%.loc7_35.1) [template = constants.%i32]
// CHECK:STDOUT:     %.loc7_35.2: type = value_of_initializer %int.make_type_signed.loc7_35 [template = constants.%i32]
// CHECK:STDOUT:     %.loc7_35.3: type = converted %int.make_type_signed.loc7_35, %.loc7_35.2 [template = constants.%i32]
// CHECK:STDOUT:     %a.param: %i32 = value_param runtime_param0
// CHECK:STDOUT:     %a: %i32 = bind_name a, %a.param
// CHECK:STDOUT:     %b.param: %i32 = value_param runtime_param1
// CHECK:STDOUT:     %b: %i32 = bind_name b, %b.param
// CHECK:STDOUT:     %return.param: ref %i32 = out_param runtime_param2
// CHECK:STDOUT:     %return: ref %i32 = return_slot %return.param
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Or(%a.param_patt: %i32, %b.param_patt: %i32) -> %i32 = "int.or";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @RuntimeCall(%a.param_patt: %i32, %b.param_patt: %i32) -> %i32 {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %Or.ref: %Or.type = name_ref Or, file.%Or.decl [template = constants.%Or]
// CHECK:STDOUT:   %a.ref: %i32 = name_ref a, %a
// CHECK:STDOUT:   %b.ref: %i32 = name_ref b, %b
// CHECK:STDOUT:   %int.or: init %i32 = call %Or.ref(%a.ref, %b.ref)
// CHECK:STDOUT:   %.loc8_18.1: %i32 = value_of_initializer %int.or
// CHECK:STDOUT:   %.loc8_18.2: %i32 = converted %int.or, %.loc8_18.1
// CHECK:STDOUT:   return %.loc8_18.2
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @__global_init() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %arr.ref: ref %.35 = name_ref arr, file.%arr
// CHECK:STDOUT:   %.loc5: %.36 = addr_of %arr.ref
// CHECK:STDOUT:   %arr_p: %.36 = bind_name arr_p, %.loc5
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
