{
  lib,
  python3,
  fetchFromGitHub,
  gobject-introspection,
  wrapGAppsHook3,
  at-spi2-core,
  gtk-layer-shell,
  libwnck,
}:
python3.pkgs.buildPythonApplication {
  pname = "hints";
  version = "0.0.3-unstable-2025-01-25";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AlfredoSequeida";
    repo = "hints";
    rev = "28bdbc1ef6d4df654a20a481a6429da07dccecc9";
    hash = "sha256-rbYfRlH8Sgz7g1IV6duaMym06mxHBHaySNjs6bLs1so=";
  };

  disabled = python3.pkgs.pythonOlder "3.10";

  build-system = with python3.pkgs; [setuptools];

  dependencies = with python3.pkgs; [
    pygobject3
    pillow
    pyscreenshot
    opencv-python
    pyatspi
  ];

  nativeBuildInputs = [
    gobject-introspection
    wrapGAppsHook3
  ];

  buildInputs = [
    at-spi2-core
    libwnck # for X11
    gtk-layer-shell
  ];

  makeWrapperArgs = ["\${gappsWrapperArgs[@]}"];

  meta = {
    description = "Navigate GUIs without a mouse by typing hints in combination with modifier keys";
    homepage = "https://github.com/AlfredoSequeida/hints";
    license = with lib.licenses; [gpl3Only];
    platforms = lib.platforms.linux;
    maintainers = [];
  };
}
