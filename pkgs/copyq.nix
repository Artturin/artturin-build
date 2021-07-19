{ stdenv
, lib
, mkDerivation
, fetchFromGitHub
, cmake
, extra-cmake-modules
, qtbase
, qtscript
, libXfixes
, libXtst
, qtx11extras
, git
, knotifications
, qtwayland
, wayland
}:

mkDerivation rec {
  pname = "CopyQ";
  version = "4.1.0";

  src = fetchFromGitHub {
    owner = "hluk";
    repo = "CopyQ";
    rev = "v${version}";
    sha256 = "1iacnd9dn0mrajff80r2g5nlks5sch9lmpl633mnyqmih9dwx2li";
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    git
  ];

  buildInputs = [
    qtbase
    qtscript
    libXfixes
    libXtst
    qtx11extras
  ] ++ lib.optionals stdenv.isLinux [
    knotifications
    qtwayland
    wayland
  ];

  meta = with lib; {
    homepage = "https://hluk.github.io/CopyQ";
    description = "Clipboard Manager with Advanced Features";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ willtim artturin ];
    # NOTE: CopyQ supports windows and osx, but I cannot test these.
    # OSX build requires QT5.
    platforms = platforms.unix;
  };
}
