data:extend({
    --use or not use base values if mod overwrites them
    {
        type = 'bool-setting',
        name = 'worm-artillery-use-base-ranges',
        setting_type = 'startup',
        default_value = true
    }
})

for _, size in pairs({'small', 'medium', 'big', 'behemoth'}) do
    data:extend({
        -- enable/disable behavior
        {
            type = 'bool-setting',
            name = size .. '-worm-artillery-enabled',
            setting_type = 'startup',
            default_value = true
        },
        -- range modifier
        {
            type = 'double-setting',
            name = size .. '-worm-artillery-range-modifier',
            setting_type = 'startup',
            minimum_value = 1,
            maximum_value = 10,
            default_value = 7
        }
    })
end
