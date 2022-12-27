potionConfig = {}

--Global multipliers, applied if not overrides or effect specific multipliers are applied
potionConfig.durationMult = 2
potionConfig.weightMult = 0.01
potionConfig.magMult = 1
potionConfig.valueMult = 1.2

--Used to set hard limits on properties of player made potions
--See commented config below for format
potionConfig.limits = {}

potionConfig.limits = {
    duration = {
        max = 1800,
        min = 10
    },
    magnitude = {
        max = 150,
        min = 1
    },
    weight = {
        max = 1,
        min = 0.0001
    },
    value = {
        max = 500,
        min = 1
    }
}


--Can specify weight and value for all player made potions
potionConfig.overrides = {
}

--Used to customize magnitude and duration multipliers on a per-effect basis
--Can set limits per-effect, see commented code in RESTORE_MAGICKA effect
--for reference
potionConfig.effects = {
    RESTORE_HEALTH = {
        durationMult = 0.5,
        magMult = 2
    },
    RESTORE_MAGICKA = {
        durationMult = 0.5,
        magMult = 2,
        --[[
        limits = {
            magnitude = {
                max = 1000,
                min = 20
            },
            duration = {
                max = 4,
                min = 1
            }
        }]]
    },
    FORTIFY_ATTRIBUTE = {
        durationMult = 2,
        magMult = 0.5
    }
}

