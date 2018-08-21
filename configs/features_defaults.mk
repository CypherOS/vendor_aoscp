#
# Copyright (C) 2018 CypherOS
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

#
# Handle various configurations for Luna platform features.
#
# Guarantees that the following are defined:
#     TARGET_LUNA_PLATFORM_THEMES
#

# This configuration allows including Luna platform themes in aoscp
# builds. Our themes utitlize the OMS platform natively embedded in
# Android alongside the core framework of Color Manager
TARGET_LUNA_PLATFORM_THEMES := false

# This configuration allows including Luna platform themes in aoscp
# builds. Our themes utitlize the OMS platform natively embedded in
# Android alongside the core framework of Color Manager
TARGET_LUNA_PLATFORM_SEPOLICY := false

# This configuration allows including Luna platform apps in aoscp
# builds, that depend heavily on the Android SDK. When the sdk is
# updated, apps may require updates themselves to support the new
# API's.
TARGET_LUNA_PLATFORM_SDK_APPS := false
