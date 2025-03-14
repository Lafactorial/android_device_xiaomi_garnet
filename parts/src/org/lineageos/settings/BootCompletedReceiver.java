/*
 * Copyright (C) 2015 The CyanogenMod Project
 *               2017-2019 The LineageOS Project
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

package org.lineageos.settings;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.hardware.display.DisplayManager;
import android.os.Handler;
import android.os.IBinder;
import android.os.UserHandle;
import android.provider.Settings;
import android.util.Log;
import android.view.Display;
import android.view.Display.HdrCapabilities;

import org.lineageos.settings.powertools.PowerProfileTileService;
import org.lineageos.settings.thermal.ThermalUtils;
import org.lineageos.settings.thermal.ThermalTileService;

public class BootCompletedReceiver extends BroadcastReceiver {
    private static final boolean DEBUG = true;
    private static final String TAG = "XiaomiParts";

    @Override
    public void onReceive(final Context context, Intent intent) {
        if (DEBUG) {
            Log.d(TAG, "Received intent: " + intent.getAction());
        }

        if (!intent.getAction().equals(Intent.ACTION_LOCKED_BOOT_COMPLETED)) {
            return;
        }

        // Start Thermal Management Services
        ThermalUtils.getInstance(context).startService();
        context.startServiceAsUser(new Intent(context, ThermalTileService.class), UserHandle.CURRENT);

        // Start Power Profile Tile Service
        context.startServiceAsUser(new Intent(context, PowerProfileTileService.class), UserHandle.CURRENT);

        // Enable HDR support
        try {
            final DisplayManager displayManager = context.getSystemService(DisplayManager.class);
            if (displayManager != null) {
                displayManager.overrideHdrTypes(Display.DEFAULT_DISPLAY,
                        new int[] {
                            HdrCapabilities.HDR_TYPE_HDR10,
                            HdrCapabilities.HDR_TYPE_HLG,
                            HdrCapabilities.HDR_TYPE_HDR10_PLUS
                        });
                if (DEBUG) {
                    Log.d(TAG, "HDR types overridden successfully: HDR10, HLG, HDR10+");
                }
            } else {
                Log.e(TAG, "DisplayManager is null, cannot override HDR types");
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed to override HDR types", e);
        }
    }
}
