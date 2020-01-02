require 'script/_lib/dbexports/EffectResources'
require 'script/_lib/dbexports/TraitsToEffects'

_G.CRPUIResources = {
    DBResources = {
        effects = EffectResources,
        trait_level_effects = TraitsToEffects,
    },
    AddAdditionalUIDBResources = function (dbResourceKey, resourceData)
        ConcatTableWithKeys(_G.CRPUIResources.DBResources[dbResourceKey], resourceData);
    end,
}