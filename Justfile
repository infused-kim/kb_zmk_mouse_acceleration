# Dev recipes for this module. The checks themselves are defined once in
# .pre-commit-config.yaml and run through prek, on commit and here.

_default:
    @just --list

# Set up the repo once: trust and install the mise tools, then install the
# prek git hooks
setup:
    mise trust
    mise install
    mise exec -- prek install

# Run all checks on all files. Hooks that fix or format files change them.
check:
    mise exec -- prek run --all-files

# Run only the Python script checks (ruff and ty) on all files
check-scripts:
    mise exec -- prek run --all-files ruff-check ruff-format ty
