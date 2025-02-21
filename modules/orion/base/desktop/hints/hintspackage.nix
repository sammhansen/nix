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
    rev = "config/manual-window-system";
    sha256 = "sha256-pWP8XVrFpzZ3xhLvsrerOyBMX0qx6v4DWahXTahqUZY";
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
