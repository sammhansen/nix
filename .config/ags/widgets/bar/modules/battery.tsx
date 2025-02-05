import { bind } from "astal";
import Battery from "gi://AstalBattery";

export default function BatteryLevel() {
  const bat = Battery.get_default();

  return (
    <box className="Battery">
      <revealer
        transitionDuration={200}
        revealChild={bind(bat, "charging")}
        transition="slide_right"
      >
        <icon icon={bind(bat, "batteryIconName")} />
      </revealer>
      <label className="txt-smallie" label={bind(bat, "percentage").as(p => `${Number.parseFloat((p * 100).toFixed(1))}%`)} />
      <overlay>
        <box className="bar-batt" vpack="center" homogeneous>
          <icon icon={bind(bat, "batteryIconName")} />
        </box>
        <circularprogress
          className="bat-circ-prog"
          value={bind(bat, "percentage").as(p => p)}
          startAt={0.75}
          endAt={0.75}
        />
      </overlay>
    </box>
  );
}

