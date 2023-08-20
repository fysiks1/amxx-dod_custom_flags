/*
	Original plugin ("dod_customize_flags") by =|[76AD]|= TatsuSaisei
	
	By default, this plugin requires an 8 submodel flag model for "dod_flag_axis" (which supports the british flag).  See the default model for an example.
	If you only have single submodel flag models, set "dod_flag_singlemodelonly" to 1 in amxx.cfg.  Britsh flags are not supported in this mode.

*/

#include <amxmodx>
#include <amxmisc>
#include <fakemeta>

new g_pFlagSet, g_pFlagGerman, g_pFlagNeutral, g_pFlagAllies, g_pSingleModel;

public plugin_init()
{
	register_plugin("DOD Custom Flags", "2.0", "Fysiks");
}

public plugin_precache()
{
	g_pFlagSet = register_cvar("dod_flag_set", "models/mapmodels/flags.mdl");
	g_pFlagGerman = register_cvar("dod_flag_axis", "models/mapmodels/flags.mdl");
	g_pFlagNeutral = register_cvar("dod_flag_neutral", "models/w_wflag.mdl");
	g_pFlagAllies = register_cvar("dod_flag_allies", "models/w_aflag.mdl");
	g_pSingleModel = register_cvar("dod_flag_singlemodelonly", "0");
	if( get_pcvar_num(g_pSingleModel) )
	{
		register_forward(FM_KeyValue, "fm_keyvalue_single_models");
	}
	else
	{
		register_forward(FM_KeyValue, "fm_keyvalue");
	}
}

public fm_keyvalue_single_models(entid, handle)
{
	if( pev_valid(entid) )
	{
		new szClassname[64], szKey[64], szValue[64];
		new szAxisFlagModel[64], szNeutralFlagModel[64], szAlliesFlagModel[64];
		
		get_kvd(handle, KV_ClassName, szClassname, charsmax(szClassname));
		get_kvd(handle, KV_KeyName, szKey, charsmax(szKey));
		get_kvd(handle, KV_Value, szValue, charsmax(szValue));
		
		if( equali(szClassname,"dod_control_point") )
		{	
			get_pcvar_string(g_pFlagGerman, szAxisFlagModel, charsmax(szAxisFlagModel));
			get_pcvar_string(g_pFlagNeutral, szNeutralFlagModel, charsmax(szNeutralFlagModel));
			get_pcvar_string(g_pFlagAllies, szAlliesFlagModel, charsmax(szAlliesFlagModel));

			if( equali(szKey, "point_reset_model") )
			{
				set_kvd(handle, KV_Value, szNeutralFlagModel);
			}
			else if( equali(szKey, "point_axis_model") )
			{
				set_kvd(handle, KV_Value, szAxisFlagModel);
			}
			else if( equali(szKey, "point_allies_model") )
			{
				set_kvd(handle, KV_Value, szAlliesFlagModel);
			}			
			else if( equal(szKey, "point_allies_model_bodygroup") || equal(szKey, "point_axis_model_bodygroup") || equal(szKey, "point_reset_model_bodygroup") )
			{
				set_kvd(handle, KV_Value, "0");
			}

		}
	}
}

public fm_keyvalue(entid, handle)
{
	if( pev_valid(entid) )
	{
		new szClassname[64], szKey[64], szValue[64];
		new szAxisFlagModel[64], szNeutralFlagModel[64], szAlliesFlagModel[64];
		
		get_kvd(handle, KV_ClassName, szClassname, charsmax(szClassname));
		get_kvd(handle, KV_KeyName, szKey, charsmax(szKey));
		get_kvd(handle, KV_Value, szValue, charsmax(szValue));
		
		if( equali(szClassname,"dod_control_point") )
		{	
			get_pcvar_string(g_pFlagSet, szAxisFlagModel, charsmax(szAxisFlagModel));
			get_pcvar_string(g_pFlagNeutral, szNeutralFlagModel, charsmax(szNeutralFlagModel));
			get_pcvar_string(g_pFlagAllies, szAlliesFlagModel, charsmax(szAlliesFlagModel));

			if(equali(szValue,"models/flags.mdl") || equali(szValue,"models/mapmodels/flags.mdl"))
			{
				set_kvd(handle, KV_Value, szAxisFlagModel);
			}
			else if(!equali(szValue, "models/null.mdl") && !equali(szValue, "models/mapmodels/null.mdl"))
			{
				if( equali(szKey, "point_reset_model") )
				{
					set_kvd(handle, KV_Value, szNeutralFlagModel);
				}
				else if( equali(szKey, "point_axis_model") )
				{
					set_kvd(handle, KV_Value, szAxisFlagModel);
				}
				else if( equali(szKey, "point_allies_model") )
				{
					set_kvd(handle, KV_Value, szAlliesFlagModel);
				}
			}

		}
	}
}

