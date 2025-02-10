{pkgs, ...}: {
  security = {
    wrappers.dumpcap = {
      source = "${pkgs.wireshark}/bin/dumpcap";
      capabilities = "cap_net_raw,cap_net_admin+ep";
      owner = "root";
      group = "wireshark";
    };
  };
}
