node_module(
    sources=["package.json", "yarn.lock", "src/*", "public/*"],
    package_manager='yarn',
)

node_test(
    name="unit",
    script_name="test_ci",
    dependencies=[
        ":create-react-app",
    ]
)

node_module(
    name="built-site",
    sources=["package.json", "yarn.lock", "src/*", "public/*"],
    #this has to be here or else it won't have any node_modules installed...
    dependencies=[":create-react-app"],
    package_manager='yarn',
    build_script="build_ci"
)

node_bundle(
    name="website",
    node_module=":built-site",
)