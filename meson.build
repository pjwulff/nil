project(
    'nil',
    ['c', 'vala'],
    version: '0.1.0',
    meson_version: '>= 0.50.0',
    default_options: [
        'warning_level=3',
        'werror=true',
        'optimization=3',
    ],
)

valac = meson.get_compiler('vala')

subdir('src')
