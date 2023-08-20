# DOD Custom Flags

## Model Requirements
### Default Mode
By default, this plugin requires an 8 submodel flag model for "dod_flag_set" (which supports the british flag and wall-mounted flags).  See the default model (`models/mapmodels/flags.mdl`) for an example.  Also make sure that the cvars `dod_flag_neutral` and `dod_flag_allies` contain valid single-submodel flag models.

### Single-Submodel Flags Only
If only single-submodel flags are available (Allies, Axis, and Neutral) then set `dod_flag_singlemodelonly` to `1` and make sure that `dod_flag_axis`, `dod_flag_neutral`, and `dod_flag_allies` point to valid flag models.

> [!NOTE]
> British flags will be replaced with the Allied flag in this mode.  Wall-mount flag models have unknown behavior.

## Setup
After setting or changing the cvars in a configuration file (e.g. `amxx.cfg`) you must restart the server or change the map twice for the models to be properly loaded.

