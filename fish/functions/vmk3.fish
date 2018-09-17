function vmk3post
    pip install ipython pdbpp anaconda_mode autoflake flake8-bugbear flake8 pylint python-language-server pyls-isort pyls-mypy
end

function vmk3
    mkvirtualenv --no-site-packages $argv; and vmk3post
end

function vmk36
    mkvirtualenv --no-site-packages --python=(which python3.6) $argv; and vmk3post
end
