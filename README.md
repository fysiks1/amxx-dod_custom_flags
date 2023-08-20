# DOD Custom Flags

## Model Requirements
By default, this plugin requires an 8 submodel flag model for "dod_flag_axis" (which supports the british flag and wall-mounted flags).  See the default model (`models/mapmodels/flags.mdl`) for an example.

> [!NOTE]
> If you only have single-submodel flag models, set "dod_flag_singlemodelonly" to 1 in amxx.cfg.  British flags will be replaced with the Allied flag in this mode.

## Setup
After setting the cvars in a configuration file (e.g. `amxx.cfg`) you must restart the server or change the map twice for the models to be properly loaded.

