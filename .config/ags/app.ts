import { App } from "astal/gtk3"
import style from "./scss/style.scss"
import Bar from "./widgets/bar/bar"
import NotificationPopups from "./widgets/notifications/notificationPopup"
import OSD from "./widgets/osd/osd"
import MprisPlayers from "./widgets/player/player"

App.start
  ({
    css: style,
    main() {
      App.get_monitors().map(Bar)
      OSD()
      NotificationPopups()
      MprisPlayers()
    },
  })
