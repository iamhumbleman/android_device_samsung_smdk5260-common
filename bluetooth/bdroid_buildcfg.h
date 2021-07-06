/*
 * Copyright (C) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

#include <cutils/properties.h>
#include <string.h>

inline const char* BtmGetDefaultName()
{
	char device[PROPERTY_VALUE_MAX];
	property_get("ro.product.device", device, "");

	if (!strcmp("m2a3g", device)) {
		return "SM-C111";
	} else if (!strcmp("m2alte", device)) {
		return "SM-C115";
	}

	return "Samsung";
}

#define BTM_DEF_LOCAL_NAME BtmGetDefaultName()
#endif