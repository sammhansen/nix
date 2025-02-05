export default function LauncherButton(): JSX.Element {
  return <button
    className="launcher_button"
    onClicked="rofi -show drun -show-icons -run-command 'uwsm app -- {cmd}' -theme ~/.config/rofi/themes/default.rasi"
  >
    <label label=" " />
  </button>
}
