{
  lib,
  glib,
  python311Packages,
  fetchPypi,
  setuptools,
  wheel,
  poetry-core,
  poetry,
}:
python311Packages.buildPythonApplication rec {
  pname = "senpwai";
  version = "2.1.14";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mO0dIe5tLilHj79+rFFyFymy0kAavhK8lLhDjctaDB0=";
  };

  pyproject = true;
  build-system = [
    setuptools
    wheel
    poetry-core
    poetry
  ];

  nativeBuildInputs = [
    glib
  ];

  propagatedBuildInputs =
    [
      glib
    ]
    ++ (with python311Packages; [
      requests
      yarl
      cryptography
      anitopy
      beautifulsoup4 #bs4
      configargparse #argparse
      appdirs
      tqdm
      pylnk3
      pyqt6
      # (python311Packages.cryptography.overrideAttrs (old: {
      # version = "41.0.7";
      # src = pkgs.fetchFromGitHub {
      # inherit (old.src) owner repo;
      # tag = "41.0.7";
      # hash = "sha256-Qi6b3eZWXO8dhCmf3nG5aGXXKz1ky3Nnw8q5gi9d3+8=";
      # };
      # }))
    ]);
}
