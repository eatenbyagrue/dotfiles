from i3pystatus import Status
import socket

status = Status()

status.register("clock",
                format=" %a %-d %b %X",)

status.register("disk",
    path="/",
    format="  {avail:1.0f}GB ",)

status.register("cpu_usage",
                format="  {usage}% ")

# Run different commands based on host
if "x240" in socket.gethostname():

    status.register("temp",
                format="  {temp:.0f}°C ",)


    status.register("battery",
                    format=" BAT0 {glyph}{status}{percentage:1.0f}% ",
                    glyphs="",
                    charging_color="#ffff00",
                    full_color="#00ff00",
                    battery_ident = "BAT0",
                    status={
                        "DIS": "↓",
                        "CHR": "",
                        "FULL": "",
                    },
    )
    status.register("battery",
                    format=" BAT1 {glyph}{status}{percentage:1.0f}% ",
                    glyphs="",
                    charging_color="#ffff00",
                    full_color="#00ff00",
                    battery_ident = "BAT1",
                    status={
                        "DIS": "↓",
                        "CHR": "",
                        # "FULL": "",
            "FULL": "",
                    },
    )

    status.register("network",
                    interface="wlp3s0",
                    format_up="↓{bytes_recv}KB/s {essid}",
    )

elif "pc" in socket.gethostname():

    status.register("temp",
                lm_sensors_enabled=True,
                # format="  {temp:.0f}°C ",
    format="  {Package_id_0}°C ",)

    # status.register("gpu_temp",
    #                 format="GPU {temp}°C")

    # status.register("network",
    #                 interface="wlp0s20u12",
    #                 format_up="↓{bytes_recv}KB/s {essid}",
    # )
    status.register("network",
                    interface="eno1",
                    format_up="{interface} ↓{bytes_recv}KB/s",
    )

status.run()
