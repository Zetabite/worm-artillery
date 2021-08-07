local worm_sizes = {
    {
        name = 'small',
        range = 25,
        prepare_range = 8
    },
    {
        name = 'medium',
        range = 30,
        prepare_range = 16
    },
    {
        name = 'big',
        range = 38,
        prepare_range = 24
    },
    {
        name = 'behemoth',
        range = 48,
        prepare_range = 36
    }
}

for _, size in pairs(worm_sizes) do
    local name = size.name
    if settings.startup[name .. '-worm-artillery-enabled'].value then
        local range_modifier = settings.startup[name .. '-worm-artillery-range-modifier'].value

        local worm = data.raw['turret'][name .. '-worm-turret']
        local range = worm.attack_parameters.range
        local prepare_range = worm.prepare_range - range

        if settings.startup['worm-artillery-use-base-ranges'].value then
            range = size.range
            prepare_range = size.prepare_range
        end

        range = range * range_modifier
        worm.attack_parameters.range = range
        worm.prepare_range = range + prepare_range
    end
end
