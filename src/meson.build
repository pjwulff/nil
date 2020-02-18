version_split = meson.project_version().split('.')
major_version = version_split[0]
minor_version = version_split[1]
patch_version = version_split[2]
provider = 'com.github.pjwulff'
application_id = provider + '.nil'

config_h = configuration_data()
config_h.set_quoted('PACKAGE_NAME', 'nil')
config_h.set_quoted('PACKAGE_VERSION', meson.project_version())
config_h.set_quoted('PACKAGE_STRING', 'nil-' + meson.project_version())
config_h.set_quoted('APPLICATION_ID', application_id)

configure_file(output: 'config.h', configuration: config_h)

config_lib = valac.find_library(
    'config',
    dirs: meson.current_source_dir())

config_dep = declare_dependency(
    dependencies: config_lib,
    include_directories: include_directories('.'))

nil_sources = [
    'nil/application.vala',
    'main.vala',
]

nil_deps = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('gio-2.0'),
    dependency('readline'),
    config_dep,
]

executable(
    'nil',
    nil_sources,
    vala_args: '--target-glib=2.58',
    dependencies: nil_deps,
    install: true,
)
