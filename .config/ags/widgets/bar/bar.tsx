import { App, Astal, Gtk, type Gdk } from "astal/gtk3"
import LauncherButton from "./modules/launcherbutton"
import WorkSpaces from "./modules/workspaces"
// import Media from "./modules/media"
import Time from "./modules/time"
import SysTray from "./modules/systray"
import BatteryLevel from "./modules/battery"
import Media from "./modules/media"

const AnchorLeft = (
  <box spacing={8} hexpand halign={Gtk.Align.START}>
    <LauncherButton />
    <WorkSpaces />
  </box>
);

const AnchorCenter = (
  <box spacing={8}>
    <Media />
    <BatteryLevel />
  </box>
);

const AnchorRight = (
  <box spacing={8} hexpand halign={Gtk.Align.END}>
    <SysTray />
    <Time />
  </box>
);

export default function Bar(monitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return <window
    className="Bar"
    gdkmonitor={monitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}
  >
    <box
      className="box_bg"
    // heightRequest={60}
    // widthRequest={800}
    >
      <centerbox
        cssName="centerbox"
        start_widget={AnchorLeft}
        center_widget={AnchorCenter}
        end_widget={AnchorRight}
      />
    </box>
  </window>
}
