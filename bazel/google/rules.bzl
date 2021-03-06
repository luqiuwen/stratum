#
# Copyright 2018-present Open Networking Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

load(
  "//stratum/portage:build_defs.bzl",
  "sc_cc_lib",
  "sc_cc_bin",
  "sc_cc_test",
  "sc_proto_lib",
  "sc_platform_select",
  "sc_platform_filter",
  "sc_platform_alias",
  "sc_package"
  "EMBEDDED_ARCHES",
  "HOST_ARCHES",
)

def _check_unsupported_param(param, args, name):
  if param in args:
    fail("%s is not a supported param in rule: %s" % (param, name))

def stratum_cc_library(name, **kwargs):
  _check_unsupported_param("xdeps", kwargs, name)
  sc_cc_lib(name, **kwargs)

stratum_cc_binary = sc_cc_bin

stratum_cc_test = sc_cc_test

def stratum_cc_proto_library(name, deps = [], srcs = [], arches = [],
                             python_support = False, with_grpc = True,
                             include_wkt = True, visibility = None):
  _check_unsupported_param("proto_include", kwargs, name)
  # Note: wkt are included by default in sc_proto_lib
  sc_proto_lib(
    name = name,
    deps = deps,
    hdrs = srcs,
    arches = arches,
    testonly = testonly,
    services = ["grpc"] if with_grpc else [],
    python_support = python_support,
  )

stratum_platform_select = sc_platform_select
stratum_platform_alias = sc_platform_alias
stratum_platform_select = sc_platform_select
stratum_package = sc_package