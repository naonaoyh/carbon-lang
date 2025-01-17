// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE
// TIP: To test this file alone, run:
// TIP:   bazel test //toolchain/testing:file_test --test_arg=--file_tests=toolchain/check/testdata/class/base.carbon
// TIP: To dump output, run:
// TIP:   bazel run //toolchain/testing:file_test -- --dump_output --file_tests=toolchain/check/testdata/class/base.carbon

base class Base {
  var b: i32;
}

class Derived {
  extend base: Base;

  var d: i32;
}

fn Make() -> Derived {
  return {.base = {.b = 4}, .d = 7};
}

fn Access(d: Derived) -> (i32, i32) {
  return (d.d, d.base.b);
}

// CHECK:STDOUT: --- base.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Base: type = class_type @Base [template]
// CHECK:STDOUT:   %.1: Core.IntLiteral = int_value 32 [template]
// CHECK:STDOUT:   %Int.type: type = fn_type @Int [template]
// CHECK:STDOUT:   %Int: %Int.type = struct_value () [template]
// CHECK:STDOUT:   %i32: type = int_type signed, %.1 [template]
// CHECK:STDOUT:   %.2: type = unbound_element_type %Base, %i32 [template]
// CHECK:STDOUT:   %.3: type = struct_type {.b: %i32} [template]
// CHECK:STDOUT:   %.4: <witness> = complete_type_witness %.3 [template]
// CHECK:STDOUT:   %Derived: type = class_type @Derived [template]
// CHECK:STDOUT:   %.6: type = unbound_element_type %Derived, %Base [template]
// CHECK:STDOUT:   %.7: type = unbound_element_type %Derived, %i32 [template]
// CHECK:STDOUT:   %.8: type = struct_type {.base: %Base, .d: %i32} [template]
// CHECK:STDOUT:   %.9: <witness> = complete_type_witness %.8 [template]
// CHECK:STDOUT:   %Make.type: type = fn_type @Make [template]
// CHECK:STDOUT:   %Make: %Make.type = struct_value () [template]
// CHECK:STDOUT:   %.13: Core.IntLiteral = int_value 4 [template]
// CHECK:STDOUT:   %.14: type = struct_type {.b: Core.IntLiteral} [template]
// CHECK:STDOUT:   %.15: Core.IntLiteral = int_value 7 [template]
// CHECK:STDOUT:   %.16: type = struct_type {.base: %.14, .d: Core.IntLiteral} [template]
// CHECK:STDOUT:   %Convert.type.2: type = fn_type @Convert.1, @ImplicitAs(%i32) [template]
// CHECK:STDOUT:   %Convert.type.14: type = fn_type @Convert.2, @impl.1(%.1) [template]
// CHECK:STDOUT:   %Convert.14: %Convert.type.14 = struct_value () [template]
// CHECK:STDOUT:   %.36: <witness> = interface_witness (%Convert.14) [template]
// CHECK:STDOUT:   %.37: <bound method> = bound_method %.13, %Convert.14 [template]
// CHECK:STDOUT:   %.38: <specific function> = specific_function %.37, @Convert.2(%.1) [template]
// CHECK:STDOUT:   %.39: %i32 = int_value 4 [template]
// CHECK:STDOUT:   %struct.1: %Base = struct_value (%.39) [template]
// CHECK:STDOUT:   %.40: <bound method> = bound_method %.15, %Convert.14 [template]
// CHECK:STDOUT:   %.41: <specific function> = specific_function %.40, @Convert.2(%.1) [template]
// CHECK:STDOUT:   %.42: %i32 = int_value 7 [template]
// CHECK:STDOUT:   %struct.2: %Derived = struct_value (%struct.1, %.42) [template]
// CHECK:STDOUT:   %tuple.type.1: type = tuple_type (type, type) [template]
// CHECK:STDOUT:   %tuple.type.2: type = tuple_type (%i32, %i32) [template]
// CHECK:STDOUT:   %Access.type: type = fn_type @Access [template]
// CHECK:STDOUT:   %Access: %Access.type = struct_value () [template]
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
// CHECK:STDOUT:     .Base = %Base.decl
// CHECK:STDOUT:     .Derived = %Derived.decl
// CHECK:STDOUT:     .Make = %Make.decl
// CHECK:STDOUT:     .Access = %Access.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core.import = import Core
// CHECK:STDOUT:   %Base.decl: type = class_decl @Base [template = constants.%Base] {} {}
// CHECK:STDOUT:   %Derived.decl: type = class_decl @Derived [template = constants.%Derived] {} {}
// CHECK:STDOUT:   %Make.decl: %Make.type = fn_decl @Make [template = constants.%Make] {
// CHECK:STDOUT:     %return.patt: %Derived = return_slot_pattern
// CHECK:STDOUT:     %return.param_patt: %Derived = out_param_pattern %return.patt, runtime_param0
// CHECK:STDOUT:   } {
// CHECK:STDOUT:     %Derived.ref: type = name_ref Derived, file.%Derived.decl [template = constants.%Derived]
// CHECK:STDOUT:     %return.param: ref %Derived = out_param runtime_param0
// CHECK:STDOUT:     %return: ref %Derived = return_slot %return.param
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Access.decl: %Access.type = fn_decl @Access [template = constants.%Access] {
// CHECK:STDOUT:     %d.patt: %Derived = binding_pattern d
// CHECK:STDOUT:     %d.param_patt: %Derived = value_param_pattern %d.patt, runtime_param0
// CHECK:STDOUT:     %return.patt: %tuple.type.2 = return_slot_pattern
// CHECK:STDOUT:     %return.param_patt: %tuple.type.2 = out_param_pattern %return.patt, runtime_param1
// CHECK:STDOUT:   } {
// CHECK:STDOUT:     %Derived.ref: type = name_ref Derived, file.%Derived.decl [template = constants.%Derived]
// CHECK:STDOUT:     %.loc25_27: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:     %int.make_type_signed.loc25_27: init type = call constants.%Int(%.loc25_27) [template = constants.%i32]
// CHECK:STDOUT:     %.loc25_32: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:     %int.make_type_signed.loc25_32: init type = call constants.%Int(%.loc25_32) [template = constants.%i32]
// CHECK:STDOUT:     %.loc25_35.1: %tuple.type.1 = tuple_literal (%int.make_type_signed.loc25_27, %int.make_type_signed.loc25_32)
// CHECK:STDOUT:     %.loc25_35.2: type = value_of_initializer %int.make_type_signed.loc25_27 [template = constants.%i32]
// CHECK:STDOUT:     %.loc25_35.3: type = converted %int.make_type_signed.loc25_27, %.loc25_35.2 [template = constants.%i32]
// CHECK:STDOUT:     %.loc25_35.4: type = value_of_initializer %int.make_type_signed.loc25_32 [template = constants.%i32]
// CHECK:STDOUT:     %.loc25_35.5: type = converted %int.make_type_signed.loc25_32, %.loc25_35.4 [template = constants.%i32]
// CHECK:STDOUT:     %.loc25_35.6: type = converted %.loc25_35.1, constants.%tuple.type.2 [template = constants.%tuple.type.2]
// CHECK:STDOUT:     %d.param: %Derived = value_param runtime_param0
// CHECK:STDOUT:     %d: %Derived = bind_name d, %d.param
// CHECK:STDOUT:     %return.param: ref %tuple.type.2 = out_param runtime_param1
// CHECK:STDOUT:     %return: ref %tuple.type.2 = return_slot %return.param
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @Base {
// CHECK:STDOUT:   %.loc12_10.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:   %int.make_type_signed: init type = call constants.%Int(%.loc12_10.1) [template = constants.%i32]
// CHECK:STDOUT:   %.loc12_10.2: type = value_of_initializer %int.make_type_signed [template = constants.%i32]
// CHECK:STDOUT:   %.loc12_10.3: type = converted %int.make_type_signed, %.loc12_10.2 [template = constants.%i32]
// CHECK:STDOUT:   %.loc12_8: %.2 = field_decl b, element0 [template]
// CHECK:STDOUT:   %.loc13: <witness> = complete_type_witness %.3 [template = constants.%.4]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%Base
// CHECK:STDOUT:   .b = %.loc12_8
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @Derived {
// CHECK:STDOUT:   %Base.ref: type = name_ref Base, file.%Base.decl [template = constants.%Base]
// CHECK:STDOUT:   %.loc16: %.6 = base_decl %Base, element0 [template]
// CHECK:STDOUT:   %.loc18_10.1: Core.IntLiteral = int_value 32 [template = constants.%.1]
// CHECK:STDOUT:   %int.make_type_signed: init type = call constants.%Int(%.loc18_10.1) [template = constants.%i32]
// CHECK:STDOUT:   %.loc18_10.2: type = value_of_initializer %int.make_type_signed [template = constants.%i32]
// CHECK:STDOUT:   %.loc18_10.3: type = converted %int.make_type_signed, %.loc18_10.2 [template = constants.%i32]
// CHECK:STDOUT:   %.loc18_8: %.7 = field_decl d, element1 [template]
// CHECK:STDOUT:   %.loc19: <witness> = complete_type_witness %.8 [template = constants.%.9]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%Derived
// CHECK:STDOUT:   .base = %.loc16
// CHECK:STDOUT:   .d = %.loc18_8
// CHECK:STDOUT:   extend %Base.ref
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Make() -> %return: %Derived {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc22_25: Core.IntLiteral = int_value 4 [template = constants.%.13]
// CHECK:STDOUT:   %.loc22_26.1: %.14 = struct_literal (%.loc22_25)
// CHECK:STDOUT:   %.loc22_34: Core.IntLiteral = int_value 7 [template = constants.%.15]
// CHECK:STDOUT:   %.loc22_35.1: %.16 = struct_literal (%.loc22_26.1, %.loc22_34)
// CHECK:STDOUT:   %.loc22_26.2: %Convert.type.2 = interface_witness_access constants.%.36, element0 [template = constants.%Convert.14]
// CHECK:STDOUT:   %.loc22_26.3: <bound method> = bound_method %.loc22_25, %.loc22_26.2 [template = constants.%.37]
// CHECK:STDOUT:   %.loc22_26.4: <specific function> = specific_function %.loc22_26.3, @Convert.2(constants.%.1) [template = constants.%.38]
// CHECK:STDOUT:   %int.convert_checked.loc22_26: init %i32 = call %.loc22_26.4(%.loc22_25) [template = constants.%.39]
// CHECK:STDOUT:   %.loc22_26.5: init %i32 = converted %.loc22_25, %int.convert_checked.loc22_26 [template = constants.%.39]
// CHECK:STDOUT:   %.loc22_35.2: ref %Base = class_element_access %return, element0
// CHECK:STDOUT:   %.loc22_26.6: ref %i32 = class_element_access %.loc22_35.2, element0
// CHECK:STDOUT:   %.loc22_26.7: init %i32 = initialize_from %.loc22_26.5 to %.loc22_26.6 [template = constants.%.39]
// CHECK:STDOUT:   %.loc22_26.8: init %Base = class_init (%.loc22_26.7), %.loc22_35.2 [template = constants.%struct.1]
// CHECK:STDOUT:   %.loc22_35.3: init %Base = converted %.loc22_26.1, %.loc22_26.8 [template = constants.%struct.1]
// CHECK:STDOUT:   %.loc22_35.4: %Convert.type.2 = interface_witness_access constants.%.36, element0 [template = constants.%Convert.14]
// CHECK:STDOUT:   %.loc22_35.5: <bound method> = bound_method %.loc22_34, %.loc22_35.4 [template = constants.%.40]
// CHECK:STDOUT:   %.loc22_35.6: <specific function> = specific_function %.loc22_35.5, @Convert.2(constants.%.1) [template = constants.%.41]
// CHECK:STDOUT:   %int.convert_checked.loc22_35: init %i32 = call %.loc22_35.6(%.loc22_34) [template = constants.%.42]
// CHECK:STDOUT:   %.loc22_35.7: init %i32 = converted %.loc22_34, %int.convert_checked.loc22_35 [template = constants.%.42]
// CHECK:STDOUT:   %.loc22_35.8: ref %i32 = class_element_access %return, element1
// CHECK:STDOUT:   %.loc22_35.9: init %i32 = initialize_from %.loc22_35.7 to %.loc22_35.8 [template = constants.%.42]
// CHECK:STDOUT:   %.loc22_35.10: init %Derived = class_init (%.loc22_35.3, %.loc22_35.9), %return [template = constants.%struct.2]
// CHECK:STDOUT:   %.loc22_36: init %Derived = converted %.loc22_35.1, %.loc22_35.10 [template = constants.%struct.2]
// CHECK:STDOUT:   return %.loc22_36 to %return
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Access(%d.param_patt: %Derived) -> %return: %tuple.type.2 {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %d.ref.loc26_11: %Derived = name_ref d, %d
// CHECK:STDOUT:   %d.ref.loc26_12: %.7 = name_ref d, @Derived.%.loc18_8 [template = @Derived.%.loc18_8]
// CHECK:STDOUT:   %.loc26_12.1: ref %i32 = class_element_access %d.ref.loc26_11, element1
// CHECK:STDOUT:   %.loc26_12.2: %i32 = bind_value %.loc26_12.1
// CHECK:STDOUT:   %d.ref.loc26_16: %Derived = name_ref d, %d
// CHECK:STDOUT:   %base.ref: %.6 = name_ref base, @Derived.%.loc16 [template = @Derived.%.loc16]
// CHECK:STDOUT:   %.loc26_17.1: ref %Base = class_element_access %d.ref.loc26_16, element0
// CHECK:STDOUT:   %.loc26_17.2: %Base = bind_value %.loc26_17.1
// CHECK:STDOUT:   %b.ref: %.2 = name_ref b, @Base.%.loc12_8 [template = @Base.%.loc12_8]
// CHECK:STDOUT:   %.loc26_22.1: ref %i32 = class_element_access %.loc26_17.2, element0
// CHECK:STDOUT:   %.loc26_22.2: %i32 = bind_value %.loc26_22.1
// CHECK:STDOUT:   %.loc26_24.1: %tuple.type.2 = tuple_literal (%.loc26_12.2, %.loc26_22.2)
// CHECK:STDOUT:   %.loc26_24.2: ref %i32 = tuple_access %return, element0
// CHECK:STDOUT:   %.loc26_24.3: init %i32 = initialize_from %.loc26_12.2 to %.loc26_24.2
// CHECK:STDOUT:   %.loc26_24.4: ref %i32 = tuple_access %return, element1
// CHECK:STDOUT:   %.loc26_24.5: init %i32 = initialize_from %.loc26_22.2 to %.loc26_24.4
// CHECK:STDOUT:   %.loc26_24.6: init %tuple.type.2 = tuple_init (%.loc26_24.3, %.loc26_24.5) to %return
// CHECK:STDOUT:   %.loc26_25: init %tuple.type.2 = converted %.loc26_24.1, %.loc26_24.6
// CHECK:STDOUT:   return %.loc26_25 to %return
// CHECK:STDOUT: }
// CHECK:STDOUT:
