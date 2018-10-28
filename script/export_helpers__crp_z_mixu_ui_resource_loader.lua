require 'script/_lib/dbexports/MixuEffectResources'
require 'script/_lib/dbexports/MixuTraitsToEffects'

Custom_Log_Start();

Custom_Log("Loading Mixu UI Data");

_G.CRPUIResources.AddAdditionalUIDBResources("effects", MixuEffectResources);
_G.CRPUIResources.AddAdditionalUIDBResources("trait_level_effects", MixuTraitsToEffects);